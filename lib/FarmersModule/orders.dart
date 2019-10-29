import 'package:agro_chain/APIEndpoints/OrdersAPI/order.dart';

import 'package:agro_chain/models/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  @override
  Widget build(BuildContext context) {

      final userProfile=Provider.of<UserProfile>(context);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
            title: Text('Farmer Orders',

                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white
                ),
            ),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Go Back',
                onPressed: (){
                    Navigator.pop(context);
                },
                color: Colors.white,
            ),
            backgroundColor: Color.fromRGBO(52, 152,219 , 1.0) ,
            elevation: 0.0,
        ),
        body:Container(
            width: double.infinity,
            height: double.infinity,
            child: FutureBuilder(
                future: Order.getOrders(authToken: userProfile.authToken),
                builder: (context,snapshot){
                    if(!snapshot.hasData){
                        return Center(
                            child: Text('Loading...'),
                        );
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index){
                            return Padding(
                                padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 5.0,bottom: 5.0),
                                child: Card(
                                    elevation: 8.0,
                                    color: Colors.white,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(52, 152,219 , 1.0),
                                            borderRadius: BorderRadius.circular(8.0),
                                            boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    offset: Offset(0.0,10.0),
                                                    blurRadius: 5.0
                                                ),
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    offset: Offset(0.0,-10.0),
                                                    blurRadius: 5.0
                                                )

                                            ]
                                        ),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                                Padding(
                                                    padding: const EdgeInsets.only(top: 10.0,left: 15.0),
                                                    child: Text(snapshot.data[index].cropVariety+' '+snapshot.data[index].cropName,
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 24.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        )
                                                    ),
                                                ),

                                                Padding(
                                                    padding: const EdgeInsets.only(top: 4.0,left: 15.0),
                                                    child: Text('Qty:'+snapshot.data[index].quantity.toString()+' Kg',
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),
                                                    ),
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.only(top: 4.0,left: 15.0),
                                                    child: Text('Price:'+snapshot.data[index].sellingPrice.toString()+' Rs/Kg',
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),
                                                    ),
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.only(top:4.0,left: 15.0),
                                                    child: Text('Date:'+snapshot.data[index].orderDate,
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),
                                                    ),
                                                ),
                                                Padding(
                                                    padding:  const EdgeInsets.only(top: 4.0,left: 15.0),
                                                    child: Text('Buyer:'+snapshot.data[index].buyerName+' ( '+snapshot.data[index].buyerType+' )',
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),
                                                    ),
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.only(top:4.0,left: 15.0),
                                                    child: Text('Owner:'+ snapshot.data[index].ownerName+ ' ( '+snapshot.data[index].ownerType+' )',
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),
                                                    ),
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.only(top:4.0,left:15.0),
                                                    child: Row(
                                                        children: <Widget>[
                                                            Text('Status:',
                                                                style: TextStyle(
                                                                    fontSize: 18.0,
                                                                    color: Colors.white,
                                                                    wordSpacing: 2.0
                                                                ),
                                                            ),
                                                            Text(snapshot.data[index].orderStatus,
                                                                style: TextStyle(
                                                                    fontSize: 18.0,
                                                                    color: decideColor(snapshot.data[index].orderStatus),
                                                                    wordSpacing: 2.0
                                                                ),
                                                            )
                                                        ],
                                                    )
                                                ),



                                            ],
                                        ),
                                    ),
                                ),
                            );
                        });
                },
            ),
        ),
    );
  }
    Color decideColor(String status){
        if(status=='COMPLETED')
            return Colors.lightGreenAccent;
        else
            return Colors.deepOrangeAccent;
    }
}

