import 'package:agro_chain/APIEndpoints/StockAPI/stock.dart';
import 'package:agro_chain/UserServices/stock_trackback.dart';
import 'package:agro_chain/models/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConsumerTrackBack extends StatefulWidget {
  @override
  _ConsumerTrackBackState createState() => _ConsumerTrackBackState();
}

class _ConsumerTrackBackState extends State<ConsumerTrackBack> {
  @override
  Widget build(BuildContext context) {
      final userProfile=Provider.of<UserProfile>(context);
    return Scaffold(
        appBar: AppBar(
            title:Text('Choose Order'),
            elevation: 0.0,
            backgroundColor: Color.fromRGBO(52, 152,219 , 1.0),
            leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
                Navigator.of(context).pop();
            },),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: FutureBuilder(
                future: Stock.getStocks(authToken: userProfile.authToken),
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
                            // print(snapshot.data[index]);
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
                                                    padding: const EdgeInsets.only(top:4.0,left: 15.0),
                                                    child: Text(snapshot.data[index].cropVariety+' '+snapshot.data[index].cropName,
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 24.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),
                                                    ),
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.only(top:4.0,left:15.0),
                                                    child: Text('Order ID:'+snapshot.data[index].stockId,
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),
                                                    ),
                                                ),
                                                SizedBox(
                                                    height: 10.0,
                                                ),
                                                Padding(
                                                    padding:const EdgeInsets.only(top:4.0,left:15.0),
                                                    child: Text('Bought:'+snapshot.data[index].quantity.toString()+'Kg',
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),
                                                    ),
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.only(top:4.0,left: 15.0),
                                                    child: Text('Grade:'+snapshot.data[index].cropGrade,
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),
                                                    ),
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                                                    child:   Material(
                                                        child: InkWell(
                                                            onTap: () {
                                                                Navigator.push(context, MaterialPageRoute(
                                                                    builder: (context)=>StockTrackBack(stockDetail: snapshot.data[index],)
                                                                ));

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
                                                                    child: Text('TRACKBACK',
                                                                        style: TextStyle(
                                                                            fontSize: 20.0,
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            color: Colors.white

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
        ),
    );
  }
}
