import 'package:agro_chain/APIEndpoints/OrdersAPI/order.dart';
import 'package:agro_chain/models/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RetailerDashboard extends StatefulWidget {
  @override
  _RetailerDashboardState createState() => _RetailerDashboardState();
}

class _RetailerDashboardState extends State<RetailerDashboard> {
    Future<bool> _onWillPop() {
        return showDialog(
            context: context,
            builder: (context) => new AlertDialog(
                title: new Text('Logout',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 20.0),),
                content: new Text('Do you want to Logout?'),
                actions: <Widget>[
                    new FlatButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child:  Text('NO',style: TextStyle(fontSize: 10.0,color: Colors.black),),
                    ),
                    new FlatButton(
                        onPressed: () {
                            Provider.of<UserProfile>(context).reset();
                            Navigator.of(context).pop(true);
                        },
                        child:  Text('YES',style: TextStyle(fontSize: 10.0,color: Colors.black),),
                    ),
                ],
            ),
        ) ?? false;
    }

  @override
  Widget build(BuildContext context) {
        final userProfile=Provider.of<UserProfile>(context);
        //int orderCount;





    return WillPopScope(
        onWillPop: _onWillPop,
      child: Scaffold(
          appBar: AppBar(
              title: Text('Retailer'),
              backgroundColor: Color.fromRGBO(52, 152,219 , 1.0),
              elevation: 0.0,
          ),
          drawer:Drawer(
              child: ListView(
                  children: <Widget>[
                      ListTile(
                          title: Text('ITEM 1'),
                          trailing: Icon(Icons.arrow_forward),
                          onTap: (){
                              Navigator.pop(context);
                          },
                      )
                  ],
              ),
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Flexible(
                      flex: 2,
                      child: Container(
                          color: Color.fromRGBO(52, 152,219 , 1.0),
                          child: Column(
                              children: <Widget>[
                                  Flexible(
                                      flex: 2,
                                      child: Container(
                                          child: Center(
                                              child: CircleAvatar(
                                                  radius: 60.0,
                                                  backgroundColor: Colors.white,
                                                  child: Text(userProfile.orders.toString(),
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(52, 152, 219, 1.0),
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 60.0,

                                                      ),),
                                              ),
                                          ),
                                      ),
                                  ),
                                  Flexible(
                                      flex: 1,
                                      child: Row(
                                          children: <Widget>[
                                              Expanded(
                                                  flex:1,
                                                  child: Padding(
                                                      padding: const EdgeInsets.only(top: 20.0,right: 10.0),
                                                      child: Image.asset('assets/image/cereal.png',width: 70.0,height: 70.0,),
                                                  ),
                                              ),
                                              Expanded(
                                                  flex: 2,
                                                  child: Center(
                                                      child: Text('ORDERS',
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 30.0
                                                          ),
                                                          textAlign: TextAlign.justify,
                                                      ),
                                                  ),
                                              ),
                                              Expanded(
                                                  flex: 1,

                                                  child:Padding(
                                                      padding: const EdgeInsets.only(top: 20.0,left: 10.0),
                                                      child: Image.asset('assets/image/cereal.png',width: 70.0,height: 70.0,),
                                                  ) ,
                                              )
                                          ],
                                      ),
                                  )
                              ],
                          ),
                      ),
                  ),
                  Flexible(
                      flex: 3,
                      child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
                                      child: Material(

                                          child: InkWell(
                                              onTap: (){
                                                  Navigator.pushNamed(context, '/retailerCropSearch');
                                              },
                                              child: Container(
                                                  height: 80.0,
                                                  child: Row(
                                                      children: <Widget>[
                                                          Expanded(
                                                              flex: 1,
                                                              child:Image.asset('assets/image/corn.png',width: 70.0,height: 70.0,) ,
                                                          ),
                                                          Expanded(
                                                              flex: 2,
                                                              child: Text('View Crop Listings',
                                                                  style:TextStyle(
                                                                      color: Colors.black,
                                                                      fontSize: 20.0,
                                                                      fontWeight: FontWeight.bold
                                                                  ) ,),

                                                          ),
                                                      ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      boxShadow: [
                                                          BoxShadow(
                                                              color: Colors.black12,
                                                              offset: Offset(0.0,15.0),
                                                              blurRadius: 15.0

                                                          ),
                                                          BoxShadow(
                                                              color: Colors.black12,
                                                              offset: Offset(0.0,-10.0),
                                                              blurRadius: 15.0

                                                          )

                                                      ]
                                                  ),
                                              ),
                                          ),
                                      ),
                                  ),

                                  Padding(
                                      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
                                      child: Material(

                                          child: InkWell(
                                              onTap: (){
                                                  Navigator.pushNamed(context, '/retailerStocks');
                                              },
                                              child: Container(
                                                  height: 80.0,
                                                  child: Row(
                                                      children: <Widget>[
                                                          Expanded(
                                                              flex: 1,
                                                              child:Image.asset('assets/image/factory.png',width: 70.0,height: 70.0,) ,
                                                          ),
                                                          Expanded(
                                                              flex: 2,
                                                              child: Text('View Stock',
                                                                  style:TextStyle(
                                                                      color: Colors.black,
                                                                      fontSize: 20.0,
                                                                      fontWeight: FontWeight.bold
                                                                  ) ,),

                                                          ),
                                                      ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      boxShadow: [
                                                          BoxShadow(
                                                              color: Colors.black12,
                                                              offset: Offset(0.0,15.0),
                                                              blurRadius: 15.0

                                                          ),
                                                          BoxShadow(
                                                              color: Colors.black12,
                                                              offset: Offset(0.0,-10.0),
                                                              blurRadius: 15.0

                                                          )

                                                      ]
                                                  ),
                                              ),
                                          ),
                                      ),
                                  ),

                                  Padding(
                                      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
                                      child: Material(

                                          child: InkWell(
                                              onTap: (){
                                                  // Navigator.pushNamed(context, '/farmerProfile');
                                                  Navigator.pushNamed(context, '/retailerOrders');
                                              },
                                              child: Container(
                                                  height: 80.0,
                                                  child: Row(
                                                      children: <Widget>[
                                                          Expanded(
                                                              flex: 1,
                                                              child:Image.asset('assets/image/checklist.png',width: 70.0,height: 70.0,) ,
                                                          ),
                                                          Expanded(
                                                              flex: 2,
                                                              child: Text('View orders',
                                                                  style:TextStyle(
                                                                      color: Colors.black,
                                                                      fontSize: 20.0,
                                                                      fontWeight: FontWeight.bold
                                                                  ) ,),

                                                          ),
                                                      ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      boxShadow: [
                                                          BoxShadow(
                                                              color: Colors.black12,
                                                              offset: Offset(0.0,15.0),
                                                              blurRadius: 15.0

                                                          ),
                                                          BoxShadow(
                                                              color: Colors.black12,
                                                              offset: Offset(0.0,-10.0),
                                                              blurRadius: 15.0

                                                          )

                                                      ]
                                                  ),
                                              ),
                                          ),
                                      ),
                                  ),

                                  Padding(
                                      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
                                      child: Material(

                                          child: InkWell(
                                              onTap: (){
                                                   Navigator.pushNamed(context, '/retailerProfile');
                                              },
                                              child: Container(
                                                  height: 80.0,
                                                  child: Row(
                                                      children: <Widget>[
                                                          Expanded(
                                                              flex: 1,
                                                              child:Image.asset('assets/image/resume.png',width: 70.0,height: 70.0,) ,
                                                          ),
                                                          Expanded(
                                                              flex: 2,
                                                              child: Text('View profile',
                                                                  style:TextStyle(
                                                                      color: Colors.black,
                                                                      fontSize: 20.0,
                                                                      fontWeight: FontWeight.bold
                                                                  ) ,),

                                                          ),
                                                      ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      boxShadow: [
                                                          BoxShadow(
                                                              color: Colors.black12,
                                                              offset: Offset(0.0,15.0),
                                                              blurRadius: 15.0

                                                          ),
                                                          BoxShadow(
                                                              color: Colors.black12,
                                                              offset: Offset(0.0,-10.0),
                                                              blurRadius: 15.0

                                                          )

                                                      ]
                                                  ),
                                              ),
                                          ),
                                      ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0,),
                                      child: Material(

                                          child: InkWell(
                                              onTap: (){
                                                  Navigator.pushNamed(context, '/userAddBalance');
                                              },
                                              child: Container(
                                                  child: Row(
                                                      children: <Widget>[
                                                          Expanded(
                                                              flex: 1,
                                                              child:Image.asset('assets/image/wallet.png',width: 70.0,height: 70.0,) ,
                                                          ),
                                                          Expanded(
                                                              flex: 2,
                                                              child: Text('Add Balance',
                                                                  style:TextStyle(
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.black,
                                                                      fontSize: 20.0
                                                                  ) ,),

                                                          ),
                                                      ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      boxShadow: [
                                                          BoxShadow(
                                                              color: Colors.black12,
                                                              offset: Offset(0.0,15.0),
                                                              blurRadius: 15.0

                                                          ),
                                                          BoxShadow(
                                                              color: Colors.black12,
                                                              offset: Offset(0.0,-10.0),
                                                              blurRadius: 15.0

                                                          )

                                                      ]
                                                  ),
                                              ),
                                          ),
                                      ),
                                  ),



                              ],
                          ),
                      ),
                  )
              ],
          ),
      ),
    );
  }
}
