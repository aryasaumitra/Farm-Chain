import 'package:agro_chain/ConsumerModule/consumer_dashboard.dart';
import 'package:agro_chain/ConsumerModule/consumer_orders.dart';
import 'package:agro_chain/ConsumerModule/consumer_trackback.dart';
import 'package:agro_chain/FarmersModule/add_crop.dart';
import 'package:agro_chain/FarmersModule/farmer_dashboard.dart';
import 'package:agro_chain/FarmersModule/farmer_profile.dart';
import 'package:agro_chain/FarmersModule/orders.dart';
import 'package:agro_chain/FarmersModule/view_crops.dart';
import 'package:agro_chain/LoginModule/login_page.dart';
import 'package:agro_chain/RetailerModule/retailer_dashboard.dart';
import 'package:agro_chain/SplashModule/splash_screen.dart';
import 'package:agro_chain/WholesalerModule/wholesaler_dashboard.dart';
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
                '/farmerProfile':(context)=>FarmerProfile(),
                '/farmerViewCrops':(context)=>ViewCrops(),
                '/farmerAddCrop':(context)=>AddCrop(),
                '/farmerOrders':(context)=>Orders(),
                '/consumerDashboard':(context)=>ConsumerDashboard(),
                '/consumerTrackback':(context)=>ConsumerTrackBack(),
                '/consumerOrders':(context)=>ConsumerOrders(),
                '/wholesalerDashboard':(context)=>WholesalerDashboard(),
                '/retailerDashboard':(context)=>RetailerDashboard()
            },
        );

      }
}
