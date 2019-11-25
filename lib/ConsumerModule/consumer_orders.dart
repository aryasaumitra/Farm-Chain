import 'package:agro_chain/APIEndpoints/OrdersAPI/order.dart';
import 'package:agro_chain/ConsumerModule/consumer_add_review.dart';
import 'package:agro_chain/UserServices/add_review.dart';
import 'package:agro_chain/models/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ConsumerOrders extends StatefulWidget {
  @override
  _ConsumerOrdersState createState() => _ConsumerOrdersState();
}

class _ConsumerOrdersState extends State<ConsumerOrders> {
  @override
  Widget build(BuildContext context) {
      final userProfile=Provider.of<UserProfile>(context);
    return Scaffold(
        appBar: AppBar(
            title: Text('Consumer Orders'),
            elevation: 0.0,
            backgroundColor: Color.fromRGBO(52, 152,219 , 1.0),
            leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
                Navigator.of(context).pop();
            },),
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
                                                    child: Text('Price:'+snapshot.data[index].stockPrice.toString()+' Rs/Kg',
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
                                                snapshot.data[index].orderStatus=='COMPLETED'?snapshot.data[index].orderReview==true?Padding(
                                                    padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                                                    child: Container(
                                                        height: 40.0,
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
//
                                                            // borderRadius: BorderRadius.circular(10.0),
                                                            color: Colors.green,
                                                        ),
                                                        child: Center(
                                                            child: Text('ORDER REVIEWED',
                                                                style: TextStyle(
                                                                    fontSize: 20.0,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    color: Colors
                                                                        .white
                                                                ),
                                                            ),
                                                        ),
                                                    ),
                                                ):Padding(
                                                    padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                                                    child: Material(
                                                        child: InkWell(
                                                            onTap: (){
//
                                                                Navigator.push(context, MaterialPageRoute(
                                                                    builder: (context)=>AddReview(orderDetail: snapshot.data[index],)
                                                                ));
                                                            },
                                                            child: Container(
                                                                height: 40.0,
                                                                width: double.infinity,
                                                                decoration: BoxDecoration(
//                                                    color: Color
//                                                        .fromRGBO(
//                                                        52, 152, 219,
//                                                        1.0),
                                                                    color: Colors.orange,
//                                                                borderRadius: BorderRadius
//                                                                    .circular(8.0),

                                                                ),
                                                                child: Center(
                                                                    child: Text('SUBMIT REVIEW',
                                                                        style: TextStyle(
                                                                            fontSize: 20.0,
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            color: Colors
                                                                                .white
                                                                        ),
                                                                    ),
                                                                ),
                                                            ),
                                                        ),
                                                    ),
                                                ):Padding(
                                                    padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                                                    child:   Material(
                                                        child: InkWell(
                                                            onTap: () async{
                                                                bool response=await Order.approveOrder(authToken: userProfile.authToken, orderId: snapshot.data[index].orderId);
                                                                if(response==true){
                                                                    print('Order Approved');
                                                                    setState(() {

                                                                    });
                                                                }
                                                                else{
                                                                    print('Order Not Approved');
                                                                }
                                                            },
                                                            child: Container(
                                                                height: 40.0,
                                                                width: double.infinity,
                                                                decoration: BoxDecoration(
//
                                                                    // borderRadius: BorderRadius.circular(10.0),
                                                                    color: Colors.green,
                                                                ),
                                                                child: Center(
                                                                    child: Text('MARK AS COLLECTED',
                                                                        style: TextStyle(
                                                                            fontSize: 20.0,
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            color: Colors
                                                                                .white
                                                                        ),
                                                                    ),
                                                                ),
                                                            ),
                                                        ),
                                                    ),
                                                )


                                            ],
                                        ),
                                    ),
                                ),
                            );
                        });
                },
            ),
        ) ,
    );
  }
  Color decideColor(String status){
      if(status=='COMPLETED')
          return Colors.lightGreenAccent;
      else
          return Colors.deepOrangeAccent;
  }
}
