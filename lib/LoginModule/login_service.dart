import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;

class LoginService{

   static Future<http.Response> userLogin(Map<dynamic,dynamic> data) async{
       print(data);
    //   print(convert.jsonEncode(data));
       var body=convert.jsonEncode(data);

       print(body);
       Map<String, String> headers = {"Content-type": "application/json"};
        var url='http://farmchain.rishavanand.com:3000/user/login';
        var response= await http.post(url,
            headers: {"Content-Type":"application/json"},
            body: body
        );
//
        return response;
  //      HttpClient httpClient=new HttpClient();
    //    HttpClientRequest request=await httpClient.postUrl(Uri.parse(url));
   //     request.headers.set('content-type', 'application/json');
//        convert.jsonEncode(data);

    }

    static Future<http.Response> userProfile(var authToken) async{

            Map<String,String> header={"Authorization":"$authToken"};
            var url='http://farmchain.rishavanand.com:3000/user/profile';
            var response=await http.get(url,
                headers: header
            );
            return response;
    }
   static Future<http.Response> userPhoto(var authToken) async{

       Map<dynamic,dynamic> header={"Authorization":"$authToken"};
       var url='http://farmchain.rishavanand.com:3000/user/photo';
       var response=await http.get(url,
           headers: header
       );
       return response;
   }

}