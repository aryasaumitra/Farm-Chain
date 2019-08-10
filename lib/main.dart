import 'package:agro_chain/FarmersModule/farmer_dashboard.dart';
import 'package:agro_chain/FarmersModule/farmer_profile.dart';
import 'package:agro_chain/LoginModule/login_page.dart';
import 'package:agro_chain/SplashModule/splash_screen.dart';
import 'package:flutter/material.dart';

import 'RegisterModule/register_page.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
            title:"Farm Chain",
            initialRoute: '/',
            routes: {
                '/':(context)=>SplashPage(),
                '/loginpage':(context)=>LoginPage(),
                '/registerPage':(context)=>RegisterPage(),
                '/farmerDashboard':(context)=>FarmerDashboard(),
                '/farmerProfile':(context)=>FarmerProfile()
            },
        );

      }
}
