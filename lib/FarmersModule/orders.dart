import 'package:agro_chain/FarmersModule/order_detail.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
    List<OrderDetail> orders=OrderDetail.getOrderList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
            title: Text('Orders',

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
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                    Expanded(
                        flex:6 ,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: orders.length,
                            itemBuilder:(context,index){
                                return Padding(
                                    padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 20.0,bottom: 10.0),
                                    child: Container(
                                        width: double.infinity,
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
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
//                                                  SizedBox(
//                                                      height: 5.0,
//                                                      width: 5.0,
//                                                  ),
                                                  Text(orders[index].orderName,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20.0
                                                      ),
                                                  ),
                                                  SizedBox(
                                                      height: 5.0,
                                                      width: 5.0,
                                                  ),
                                                  Text('Qty:'+orders[index].orderQuantity,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20.0
                                                      ),
                                                  ),
                                                  Text('Price:'+orders[index].orderPrice,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20.0
                                                      ),
                                                  ),
                                                  Text('Date:'+orders[index].orderDate,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20.0
                                                      ),
                                                  ),
                                                  Text('Buyer:'+orders[index].orderBuyer,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20.0
                                                      ),
                                                  ),
                                                  Text('Mobile:'+orders[index].orderContactNumber,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20.0
                                                      ),
                                                  ),
                                                    Row(
                                                        children: <Widget>[
                                                            Text('Status:',
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 20.0
                                                                ),
                                                            ),
                                                            getStatus(orders[index].orderStatus)
                                                        ],
                                                    ),


                                              ],
                                          ),
                                        ),
                                    ),
                                );
                            }
                        ),
                    ),
                    Expanded(
                        flex:1,
                        child: Row(
                            children: <Widget>[
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                        padding: const EdgeInsets.only(top: 20.0,right: 10.0),
                                        child: Image.asset('assets/image/cereal.png',width: 70.0,height: 70.0,),
                                    ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: SizedBox(
                                        width: 70.0,
                                        height: 70.0,
                                    ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                        padding: const EdgeInsets.only(top: 20.0,right: 10.0),
                                        child: Image.asset('assets/image/cereal.png',width: 70.0,height: 70.0,),
                                    ),
                                )
                            ],
                        ),
                    )

            ],
        ),
    );
  }
}

Widget getStatus(String currentStatus){
    if(currentStatus=='PENDING COLLECTION') {
        return Text(currentStatus,
            style: TextStyle(
                color: Colors.orange,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
        );
    }
    else if(currentStatus=='COLLECTED'){
        return Text(currentStatus,
            style: TextStyle(
                color: Colors.green,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
        );
    }
    return Text('UNKNOWN',
        style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 20.0
        ),
    );
}