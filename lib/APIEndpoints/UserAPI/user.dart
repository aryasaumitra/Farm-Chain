import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class User{
    // ignore: missing_return
    static Future<int> getReview({@required var authToken,@required var sellerId}) async{
        var response=await http.get('http://farmchain.rishavanand.com:3000/user/'+sellerId+'/review',
            headers: {
                "Authorization": "$authToken"
            }
        ).catchError((err){
            print(err);
        });
        if(response.statusCode==200){
            var jsonData=jsonDecode(response.body);
           // print(jsonData['payload']['review']);
            return jsonData['payload']['review'];
        }

    }
}