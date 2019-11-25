import 'dart:convert';

import 'package:agro_chain/APIEndpoints/StockAPI/stock_model.dart';
import 'package:agro_chain/APIEndpoints/StockAPI/stock_trackback_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Stock{

    // ignore: missing_return
    static Future<List<StockDetail>> getStocks({@required var authToken}) async{
        List<StockDetail> stocks=[];
        var response=await http.get('http://farmchain.rishavanand.com:3000/stock',
            headers: {
                "Authorization":"$authToken"
            }
        ).catchError((err){
            print(err);
        });

        if(response.statusCode==200){
            var jsonData=jsonDecode(response.body);
          //  print(jsonData);
           // print(jsonData['payload']['stock']);
            for(var i in jsonData['payload']['stock']){
               // print(i);
                StockDetail stockDetail;
                try {
                     stockDetail = StockDetail.name(
                        i['dateCreated'],
                        i['_id'],
                        i['type'],
                        i['owner'],
                        i['quantity'],
                        int.tryParse(i['sellingPrice']),
                        i['cropCategory']['_id'],
                        i['cropCategory']['name'],
                        i['cropCategory']['variety'],
                        i['cropCategory']['grade']);
                }catch(e){
                    print(e);
                }
                stocks.add(stockDetail);
                //print(stocks.length);
            }
            //print(stocks.length);
            return stocks;
        }
    }

    // ignore: missing_return
    static Future<List<StockTrackBackDetails>> stockTrackBack({@required var authToken,@required var stockId}) async{
        List<StockTrackBackDetails> trackback=[];

        var response=await http.get('http://farmchain.rishavanand.com:3000/stock/$stockId/trackback',
            headers: {
                "Authorization":"$authToken"
            }
        ).catchError((err){
            print(err);
        });

        if(response.statusCode==200){
            var jsonData=jsonDecode(response.body);
            for(var i in jsonData['payload']['trackback']){
                print(i);
                StockTrackBackDetails stockTrackBackDetails=StockTrackBackDetails.name(
                    i['newRate'],
                    int.tryParse(i['purchaseRate']),
                    i['buyer']['firstName'],
                    i['buyer']['lastName'],
                    i['buyer']['userType'],
                    i['seller']['userType'],
                    i['buyer']['address'],
                    i['buyer']['city'],
                    i['buyer']['state'],
                    i['seller']['firstName'],
                    i['seller']['lastName'],
                    i['seller']['address'],
                    i['seller']['city'],
                    i['seller']['state']);
                trackback.add(stockTrackBackDetails);
            }
           var reversedTrackback= trackback.reversed.toList();

            return reversedTrackback;

        }
    }
}