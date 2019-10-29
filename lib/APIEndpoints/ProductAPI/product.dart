import 'dart:convert';

import 'package:agro_chain/APIEndpoints/ProductAPI/product_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Product{

    // ignore: missing_return
    static Future<List<ProductDetail>> getProduct({@required var authToken,@required var name,@required var variety,@required var grade}) async {
        List<ProductDetail> products=[];
//        print(name);
//        print(variety);
//        print(grade);
        var response;
        if(name!=null && variety!=null && grade!=null) {
             response = await http.get(
                'http://farmchain.rishavanand.com:3000/product?name=$name&variety=$variety&grade=$grade',
                headers: {
                    "Authorization": "$authToken"
                }
            ).catchError((err) {
                print(err);
            });
        }
      //  print(response.statusCode);
      //  print(response.body);
        if(response.statusCode==200){
            var jsonData=jsonDecode(response.body);

            for(var i in jsonData['payload']['product']){
               // print(i);
                ProductDetail productDetail=ProductDetail.name(
                    i['_id'],
                    i['cropCategory']['_id'],
                    i['cropCategory']['name'],
                i['cropCategory']['variety'],
                i['cropCategory']['grade'],
                i['dateCreated'],
                i['quantity'],
                int.tryParse(i['sellingPrice']),
                i['owner']['firstName'],
                i['owner']['lastName'],
                i['owner']['city'],
                i['owner']['address'],
                i['owner']['state'],
                i['owner']['userType']);
                products.add(productDetail);
            }
            return products;
        }
    }


}