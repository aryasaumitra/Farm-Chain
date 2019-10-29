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

    // ignore: missing_return
    static Future<List<OrderDetail>> getOrders({@required var authToken}) async{
        List<OrderDetail> orders=[];

        var response=await http.get('http://farmchain.rishavanand.com:3000/order',
            headers: {
                "Authorization":"$authToken"
            }
        ).catchError((err){
            print(err);
        });
        if(response.statusCode==200){
            var jsonData=jsonDecode(response.body);
            for (var i in jsonData['payload']['orders']){
                OrderDetail orderDetail= OrderDetail.name(
                    i['_id'],
                    i['stock']['_id'],
                    i['status'], i['date'],
                    i['stock']['cropCategory']['name'],
                    i['stock']['cropCategory']['grade'],
                    i['stock']['cropCategory']['variety'],
                    i['stock']['owner']['userType'],
                    i['stock']['owner']['firstName'],
                    i['stock']['owner']['lastName'],
                    i['quantity'], i['sellingPrice'],
                    i['buyer']['userType'],
                    i['buyer']['firstName'],
                    i['buyer']['lastName'],
                    int.tryParse(i['stock']['sellingPrice']));
                orders.add(orderDetail);
            }
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
}