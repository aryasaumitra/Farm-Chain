import 'package:agro_chain/LoginModule/login_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';



class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  //Image cerealImage =Image.asset("cereal.png");
 // var assetsImage=AssetImage('assets/image/cereal.png');
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 3,
        title: new Text("FARMCHAIN",
        style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.white
            ),
        ),
        image: new Image.asset('assets/image/cereal.png',width: 100.0,height: 100.0,),
        backgroundColor: Color.fromRGBO(52, 152,219 , 1.0),
        navigateAfterSeconds: new LoginPage(),
        loaderColor: Colors.white,
        //image: this.cerealImage,

    );
  }
}
