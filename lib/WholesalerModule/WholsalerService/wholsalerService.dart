
//import 'dart:convert';
import 'dart:convert' as convert;
import 'package:agro_chain/WholesalerModule/WholsalerService/owner.dart';
import 'package:agro_chain/WholesalerModule/WholsalerService/wholesaler_crop.dart';
import 'package:agro_chain/WholesalerModule/WholsalerService/wholesaler_order.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

class WholesalerService {

    static Future<List<String>> getCropNames({@required String authToken}) async{
        List<String> cropNames=[];
        var response=await http.get('http://farmchain.rishavanand.com:3000/crop/names',
            headers: {
                "Authorization":"$authToken"
            }
        ).catchError((err){
            print(err);
        });
        if(response.statusCode==200) {
            var jsonData = convert.jsonDecode(response.body);
            for(var i in jsonData['payload']['names']){
                cropNames.add(i);
            }
        }
        return cropNames;

    }

    static Future<List<String>> getCropVariety({@required String authToken, @required String cropName}) async{
        List<String> cropVariety=[];
        await http.get('http://farmchain.rishavanand.com:3000/crop/'+cropName+'/variety',
        headers: {
            "Authorization":"$authToken"
        }
        ).then((response){
            if(response.statusCode==200){
                var jsonData = convert.jsonDecode(response.body);
                for(var i in jsonData['payload']['varieties']){
                    cropVariety.add(i);
                }
            }
        }).catchError((err){
            print(err);
        });

        return cropVariety;
    }

    static Future<List<String>> getCropGrade({@required String authToken,@required String cropName,@required String cropVariety}) async{
        List<String> cropGrade=[];
        await http.get('http://farmchain.rishavanand.com:3000/crop/'+cropName+'/'+cropVariety+'/grade',
            headers: {
            "Authorization":"$authToken"
            }
        ).then((response){
            if(response.statusCode==200){
                var jsonData = convert.jsonDecode(response.body);
                for(var i in jsonData['payload']['grades']){
                    cropGrade.add(i);
                }
            }
        }).catchError((err){
            print(err);
        });
        return cropGrade;
    }

    static Future<List<WholesalerCropDetail>> getFilteredCrop({@required String authToken,@required String cropName,@required String cropVariety, @required String cropGrade}) async{
        List<WholesalerCropDetail> filterList=[];

        await http.get('http://farmchain.rishavanand.com:3000/crop/'+cropName+'/'+cropVariety+'/'+cropGrade,
            headers: {
                "Authorization":"$authToken"
            }
        ).then((response){
            if(response.statusCode==200){
                var jsonData=convert.jsonDecode(response.body);
                for (var i in jsonData['payload']['crops']){
//                    print(i);
                    print(i['owner']);
//                    print(i['price'] is int);
                    print(i['owner']['_id']);
                    Owner owner=Owner.name(i['owner']['_id'], i['owner']['mobileNumber'], i['owner']['userType'], i['owner']['address'], i['owner']['farmCity'], i['owner']['farmState'], i['owner']['firstName'], i['owner']['lastName']);
                    WholesalerCropDetail wholesalerCropDetail=WholesalerCropDetail.name(i['dateAdded'],i['_id'],i['name'],i['quantity'],i['price'],i['grade'],i['variety'],owner);
                    filterList.add(wholesalerCropDetail);
                }
               // print(filterList.length);
            }
        }).catchError((err){
            print(err);
        });

        return filterList;
    }

    // ignore: missing_return
    static Future<bool> orderCrop({@required String authToken,@required Map<String,dynamic> data}) async{
        var body=convert.jsonEncode(data);

        var response=await http.post('http://farmchain.rishavanand.com:3000/order/crop',
            headers: {
                "Authorization":"$authToken",
                "Content-Type":"application/json"
            },
            body: body
        ).catchError((err){
            print(err);
        });

        if(response.statusCode==200)
            return true;
        return false;
    }

    static Future<List<WholesalerOrder>> getOrder({@required String authToken}) async{

        List<WholesalerOrder> orderList=[];

        await http.get('http://farmchain.rishavanand.com:3000/order/crop',
            headers: {
                "Authorization":"$authToken",
            }
        ).then((response){
            if(response.statusCode==200){
                var jsonData=convert.jsonDecode(response.body);
                for(var i in jsonData['payload']['orders']){
                   // WholesalerOrder wholesalerOrder=WholesalerOrder.name(i['date'], i['status'], i['_id'], i['cropId'],i['quantity'], i['newPrice'], i['buyerId'], i['cost']);
                    WholesalerOrder wholesalerOrder=WholesalerOrder.name(i['date'], i['status'], i['_id'],i['crop']['_id'],i['crop']['name'], i['crop']['variety'], i['crop']['grade'], i['crop']['owner']['firstName'], i['crop']['owner']['lastName'],i['quantity'], i['newPrice'], i['buyerId'], i['cost']);
                    orderList.add(wholesalerOrder);
                }
            }
        }).catchError((err){
            print(err);
        });
        return orderList;
    }
}