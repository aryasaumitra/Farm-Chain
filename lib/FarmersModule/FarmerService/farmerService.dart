import 'dart:convert' as convert;
import 'package:agro_chain/FarmersModule/FarmerService/CropDetail.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class FarmerService{

    static Future<http.Response> addCrop({@required Map<dynamic,dynamic>data,@required var authToken}) async{
        var body=convert.jsonEncode(data);
        print(body);
        var response=await http.post('http://farmchain.rishavanand.com:3000/crop',
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
    static Future<List<CropDetail>> getCropList({@required var authToken}) async{
        var data=await http.get('http://farmchain.rishavanand.com:3000/crop',headers: {"Authorization":"$authToken"});
        //print(data);
        var jsonData=convert.jsonDecode(data.body);
        List<CropDetail> cropList=[];
        //print(jsonData);
        //print(jsonData['payload']['details']);
        for(var u in jsonData['payload']['details']){
            //print(u);
            //print(u['_id']);
            CropDetail crop =CropDetail(u['dateAdded'],u['_id'],u['name'],u['quantity'],u['price'],u['grade'],u['variety'],u['owner']);
            cropList.add(crop);
        }

        //print(cropList.length);
        //print(cropList);

        return cropList;
    }

    static Future<http.Response> updateCrop({@required String authToken,@required String cropId,@required Map<dynamic,dynamic> data}) async{
       // print(cropId);
       // print(authToken);
        var body=convert.jsonEncode(data);
       // print(body);
        var response= await http.post('http://farmchain.rishavanand.com:3000/crop/'+cropId+'/update/details',
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