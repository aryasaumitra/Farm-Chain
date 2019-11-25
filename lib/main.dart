import 'package:agro_chain/ConsumerModule/consumer_crop_search.dart';
import 'package:agro_chain/ConsumerModule/consumer_dashboard.dart';
import 'package:agro_chain/ConsumerModule/consumer_orders.dart';
import 'package:agro_chain/ConsumerModule/consumer_profile.dart';
import 'package:agro_chain/ConsumerModule/consumer_trackback.dart';
import 'package:agro_chain/FarmersModule/add_crop.dart';
import 'package:agro_chain/FarmersModule/farmer_dashboard.dart';
import 'package:agro_chain/FarmersModule/farmer_profile.dart';
import 'package:agro_chain/FarmersModule/orders.dart';
import 'package:agro_chain/FarmersModule/view_crops.dart';
import 'package:agro_chain/LoginModule/login_page.dart';
import 'package:agro_chain/RetailerModule/retailer_crop_search.dart';
import 'package:agro_chain/RetailerModule/retailer_dashboard.dart';
import 'package:agro_chain/RetailerModule/retailer_order.dart';
import 'package:agro_chain/RetailerModule/retailer_profile.dart';
import 'package:agro_chain/RetailerModule/retailer_stocks.dart';
import 'package:agro_chain/SplashModule/splash_screen.dart';
import 'package:agro_chain/UserServices/user_add_balance.dart';
import 'package:agro_chain/WholesalerModule/wholesaler_dashboard.dart';
import 'package:agro_chain/WholesalerModule/wholesaler_orders.dart';
import 'package:agro_chain/WholesalerModule/wholesaler_profile.dart';
import 'package:agro_chain/WholesalerModule/wholesaler_stocks.dart';
import 'package:agro_chain/WholesalerModule/wholsaler_search_crop.dart';
import 'package:agro_chain/models/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'RegisterModule/register_page.dart';

void main(){
  runApp(ChangeNotifierProvider(
      builder: (context)=>UserProfile(),
      child: MyApp(),
  ));
}
class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title:"Farm Chain",
            initialRoute: '/',
            routes: {
                '/':(context)=>SplashPage(),
                '/loginpage':(context)=>LoginPage(),
                '/registerPage':(context)=>RegisterPage(),
                '/userAddBalance':(context)=>UserAddBalance(),
                '/farmerDashboard':(context)=>FarmerDashboard(),
                '/farmerProfile':(context)=>FarmerProfile(),
                '/farmerViewCrops':(context)=>ViewCrops(),
                '/farmerAddCrop':(context)=>AddCrop(),
                '/farmerOrders':(context)=>Orders(),
                '/consumerDashboard':(context)=>ConsumerDashboard(),
                '/consumerTrackback':(context)=>ConsumerTrackBack(),
                '/consumerOrders':(context)=>ConsumerOrders(),
                '/consumerProfile':(context)=>ConsumerProfile(),
                '/consumerCropSearch':(context)=>ConsumerCropSearch(),
                '/wholesalerDashboard':(context)=>WholesalerDashboard(),
                '/wholesalerCropSearch':(context)=>WholesalerCropSearch(),
                '/wholesalerOrders':(context)=>WholesalerOrders(),
                '/wholeSalerStocks':(context)=>WholesalerStock(),
                '/wholesalerProfile':(context)=>WholesalerProfile(),
                '/retailerDashboard':(context)=>RetailerDashboard(),
                '/retailerCropSearch':(context)=>RetailerCropSearch(),
                '/retailerOrders':(context)=>RetailerOrders(),
                '/retailerStocks':(context)=>RetailerStock(),
                '/retailerProfile':(context)=>RetailerProfile()
            },
        );

      }
}
