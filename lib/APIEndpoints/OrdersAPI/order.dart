import 'dart:async';
import 'dart:convert';
import 'package:agro_chain/APIEndpoints/OrdersAPI/order_model.dart' ;

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

class Order{

    static Future<bool> addOrder({@required var authToken,@required Map<dynamic,dynamic> data})async{
        var jsonData=jsonEncode(data);
        var response= await http.post('http://farmchain.rishavanand.com:3000/order',
            headers: {
                "Authorization":"$authToken",
                "Content-Type":"application/json"
            },
            body: jsonData
        ).catchError((err){
            print(err);
        });
        if(response.statusCode==200)
            return true;
        else
            return false;

    }

    static Future<int> getCompletedOrderCount({@required var authToken}) async{
        int orderCount=0;

        var response=await http.get('http://farmchain.rishavanand.com:3000/order',
            headers: {
                "Authorization":"$authToken"
            }
        ).catchError((err){
            print(err);
        });
        if(response.statusCode==200){
            var jsonData=jsonDecode(response.body);
            for(var i in jsonData['payload']['orders']){
                if(i['status']=='completed'){
                    orderCount+=1;
                }
            }
        }
        return orderCount;

    }

    // ignore: missing_return
    static Future<List<OrderDetail>> getOrders({@required var authToken}) async{
        List<OrderDetail> orders=[];
        OrderDetail orderDetail;

        var response=await http.get('http://farmchain.rishavanand.com:3000/order',
            headers: {
                "Authorization":"$authToken"
            }
        ).catchError((err){
            print(err);
        });

        print(response.statusCode);
        if(response.statusCode==200){
            var jsonData=jsonDecode(response.body);
            print(jsonData);
            for (var i in jsonData['payload']['orders']){
                try {
                     orderDetail = OrderDetail.name(
                        i['_id'],
                        i['stock']['_id'],
                        i['status'],
                        i['date'],
                        i['cropCategory']['name'],
                        i['cropCategory']['grade'],
                        i['cropCategory']['variety'],
                        i['seller']['userType'],
                        i['seller']['firstName'],
                        i['seller']['lastName'],
                        i['quantity'],
                        i['sellingPrice'],
                        i['buyer']['userType'],
                        i['buyer']['firstName'],
                        i['buyer']['lastName'],
                        i['review']
                    );
                }catch(e){
                    print(e);
                }
                //print(orderDetail.cropVariety);
               orders.add(orderDetail);
            }
           // print(orders.length);
            return orders;
        }
    }

    static Future<bool> approveOrder({@required var authToken,@required var orderId}) async{
        var data={
          "orderId":orderId
        };
        var body=jsonEncode(data);

        var response= await http.post('http://farmchain.rishavanand.com:3000/order/approve',
            headers: {
                "Content-Type":"application/json",
                "Authorization":"$authToken"
            },
            body: body
        ).catchError((err){
            print(err);
        });
        if(response.statusCode==200)
            return true;
        else
            return false;
    }
    static Future<bool> addReview({@required var authToken,@required Map<dynamic,dynamic> data}) async{
        var body=jsonEncode(data);
        var response= await http.post('http://farmchain.rishavanand.com:3000/order/review',
            headers: {
                "Content-Type":"application/json",
                "Authorization":"$authToken"
            },
            body: body
        ).catchError((err){
            print(err);
        });
        if(response.statusCode==200){
            return true;
        }
        else{
            return false;
        }
    }
}