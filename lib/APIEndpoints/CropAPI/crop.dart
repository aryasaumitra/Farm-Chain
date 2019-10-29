import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

class Crop{

    static Future<List<String>> cropCategory({@required var authToken}) async{
        List<String> cropNames=[];
        var response=await http.get('http://farmchain.rishavanand.com:3000/crop/category',
        headers: {
            "Content-Type":"application/x-www-form-urlencoded",
            "Authorization":"$authToken"
        }
        ).catchError((err){
            print(err);
        });

        if(response.statusCode==200){
            var jsonData=jsonDecode(response.body);
            for(var i in jsonData['payload']['category']){
                cropNames.add(i['name']);
            }
        }
        return cropNames;
    }

    // ignore: missing_return
    static Future<List<String>> cropNames({@required var authToken}) async{
        List<String> cropNames=[];
        var response = await http.get(
            'http://farmchain.rishavanand.com:3000/crop/filter',
            headers: {

                "Authorization": "$authToken"
            }
        ).catchError((err){
            print(err);
        });
        if(response.statusCode==200){

            var jsonData=jsonDecode(response.body);
            print(jsonData);
            for(var i in jsonData['payload']['names']){
                cropNames.add(i);
            }
            return cropNames;
        }

    }

    // ignore: missing_return
    static Future<List<String>> cropVariety({@required var authToken,@required var name}) async{
        List<String> cropVariety=[];
        var response = await http.get(
            'http://farmchain.rishavanand.com:3000/crop/filter?name=$name',
            headers: {

                "Authorization": "$authToken"
            }
        ).catchError((err){
            print(err);
        });
        if(response.statusCode==200){

            var jsonData=jsonDecode(response.body);
            print(jsonData);
            for(var i in jsonData['payload']['varieties']){
                cropVariety.add(i);
            }
            return cropVariety;
        }

    }

    // ignore: missing_return
    static Future<List<String>> cropGrade({@required var authToken,@required var name,@required var variety}) async{
        List<String> cropGrades=[];
        var response = await http.get(
            'http://farmchain.rishavanand.com:3000/crop/filter?name=$name&variety=$variety',
            headers: {
                "Content-Type": "application/x-www-form-urlencoded",
                "Authorization": "$authToken"
            }
        ).catchError((err){
            print(err);
        });
        if(response.statusCode==200){
            var jsonData=jsonDecode(response.body);
            print(jsonData);
            for(var i in jsonData['payload']['grades']){
                cropGrades.add(i);
            }
            return cropGrades;
        }
    }

    // ignore: missing_return
//    static Future<List<String>> cropFilter({@required var authToken, var name,var variety}) async{
//        List<String> cropVariety=[];
//        List<String> cropGrades=[];
//        List<String> cropNames=[];
//        if(name==null && variety==null){
//            var response = await http.get(
//                'http://farmchain.rishavanand.com:3000/crop/filter',
//                headers: {
//                    "Content-Type": "application/x-www-form-urlencoded",
//                    "Authorization": "$authToken"
//                }
//            ).catchError((err){
//                print(err);
//            });
//            if(response.statusCode==200){
//
//                var jsonData=jsonDecode(response.body);
//                print(jsonData);
//                for(var i in jsonData['payload']['names']){
//                    cropNames.add(i);
//                }
//                return cropNames;
//            }
//        }
//        else if(variety==null) {
//            var response = await http.get(
//                'http://farmchain.rishavanand.com:3000/crop/filter?name=$name',
//                headers: {
//                    "Content-Type": "application/x-www-form-urlencoded",
//                    "Authorization": "$authToken"
//                }
//            ).catchError((err){
//                print(err);
//            });
//            if(response.statusCode==200){
//
//                var jsonData=jsonDecode(response.body);
//                print(jsonData);
//                for(var i in jsonData['payload']['varieties']){
//                    cropVariety.add(i);
//                }
//                return cropVariety;
//            }
//        }
//        else{
//            var response = await http.get(
//                'http://farmchain.rishavanand.com:3000/crop/filter?name=$name&variety=$variety',
//                headers: {
//                    "Content-Type": "application/x-www-form-urlencoded",
//                    "Authorization": "$authToken"
//                }
//            ).catchError((err){
//                print(err);
//            });
//            if(response.statusCode==200){
//                var jsonData=jsonDecode(response.body);
//                print(jsonData);
//                for(var i in jsonData['payload']['grades']){
//                    cropGrades.add(i);
//                }
//                return cropGrades;
//            }
//        }
//    }

    static Future<Response> addCrop({@required var authToken,@required Map<dynamic,dynamic>data,@required File file}) async{
        Dio dio=Dio();
        dio.options.contentType=ContentType.parse('application/x-www-form-urlencoded');
        dio.options.headers={
          "Authorization":"$authToken"
        };
        var response;
        //dio.options.contentType=Headers.contentTypeHeader;
        print(data);
        try {
            FormData formData = FormData.from({
                "name": data['name'],
                "variety": data['variety'],
                "grade": data['grade'],
                "price": data['price'],
                "quantity": data['quantity'],
                "photo": UploadFileInfo(file, 'photo.jpg')
            });

            print(formData);
             response = await dio.post(
                'http://farmchain.rishavanand.com:3000/crop', data: formData);
            print(response.statusCode);
            print(response.data);
        }catch(e){
            print(e);
            print(e.toString());
        }
        return response;
    }
}