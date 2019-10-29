import 'dart:convert' as convert;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class UserService{
    static Future<http.Response> updateProfile({@required Map<dynamic,dynamic>data, @required var authToken}) async{
        var body=convert.jsonEncode(data);
        var response=await http.post('http://farmchain.rishavanand.com:3000/user/update/profile',
            headers: {
                "Content-Type":"application/json",
                "Authorization":"$authToken"
            },
            body: body
        ).catchError((err){
            print(err);
        });
        return response;
    }

    static Future<Response> updatePhoto({@required var authToken ,@required File file}) async{
        FormData formData=FormData.from({
            "file":file
        });
        Dio dio =Dio();
        var response=await dio.post('http://farmchain.rishavanand.com:3000/user/update/photo',
            options: Options(
                headers: {
                    "Content-Type":"application/x-www-form-urlencoded",
                    "Authorization":"$authToken"
                }
            ),
            data: formData
        ).then((res){
            print(res.statusCode);
            print(res.data);

        }).catchError((err){
            print(err);
        });
//        var response=await http.post('http://farmchain.rishavanand.com:3000/user/update/photo',
//            headers: {
//                "Content-Type":"application/x-www-form-urlencoded",
//                "Authorization":"$authToken"
//            },
//            body: file
//        ).then((res){
//            print(res.statusCode);
//        }).catchError((err){
//            print(err);
//        });
        return response;
    }


    static Future<http.Response> updateBalance({@required var authToken,@required Map<dynamic,dynamic>data}) async{

        var body=convert.jsonEncode(data);
        var response=await http.post('http://farmchain.rishavanand.com:3000/user/update/balance',
            headers: {
                "Content-Type":"application/json",
                "Authorization":"$authToken"
            },
            body: body
        ).catchError((err){
            print(err);
        });

        return response;
    }
}