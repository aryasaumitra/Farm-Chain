import 'package:agro_chain/APIEndpoints/StockAPI/stock.dart';
import 'package:agro_chain/APIEndpoints/StockAPI/stock_model.dart';
import 'package:agro_chain/models/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class StockTrackBack extends StatefulWidget {
    final StockDetail stockDetail;

    StockTrackBack({Key key, @required this.stockDetail}):super(key:key);
  @override
  _StockTrackBackState createState() => _StockTrackBackState(this.stockDetail);
}

class _StockTrackBackState extends State<StockTrackBack> {
    StockDetail stockDetail;
    _StockTrackBackState(StockDetail stockDetail){
        this.stockDetail=stockDetail;
    }
  @override
  Widget build(BuildContext context) {
      final userProfile=Provider.of<UserProfile>(context);
    return Scaffold(
        appBar: AppBar(
            title: Text(this.stockDetail.cropVariety+' '+this.stockDetail.cropName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                ),
            ),
            backgroundColor: Color.fromRGBO(52, 152,219 , 1.0) ,
            elevation: 0.0,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Go Back',
                onPressed: (){
                    Navigator.pop(context);
                },
                color: Colors.white,
            ),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: FutureBuilder(
                future: Stock.stockTrackBack(authToken: userProfile.authToken, stockId: this.stockDetail.stockId),
                builder: (context,AsyncSnapshot snapshot){
                    if(!snapshot.hasData){
                        return Center(
                            child: CircularProgressIndicator()
                        );
                    }
                    return Timeline.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context ,int i){
                            return TimelineModel(
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Card(
                                      elevation: 0.0,
                                    child: Container(
                                        width: double.infinity,
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                                Row(
                                                    children: <Widget>[
                                                        Text('Seller:',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16.0),),
                                                        Text(snapshot.data[i].sellerName,style: TextStyle(color: Colors.black,fontSize: 16.0),)
                                                    ],
                                                ),
                                                SingleChildScrollView(

                                                    scrollDirection: Axis.horizontal,
                                                  child: Row(
                                                      children: <Widget>[
                                                          Text('Location:',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16.0),),
                                                          Text(snapshot.data[i].sellerAddress,style: TextStyle(color: Colors.black,fontSize: 16.0),)
                                                      ],
                                                  ),
                                                ),
                                                Row(
                                                    children: <Widget>[
                                                        Text('Selling Price:',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16.0),),
                                                        Text(snapshot.data[i].purchaseRate.toString()+'/Kg',style: TextStyle(color: Colors.black,fontSize: 16.0),)
                                                    ],
                                                ),
                                                Row(
                                                    children: <Widget>[
                                                        Text('Type:',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16.0),),
                                                        Text(snapshot.data[i].sellerType,style: TextStyle(color: Colors.black,fontSize: 16.0),)
                                                    ],
                                                ),
                                                SizedBox(
                                                    height: 10.0,
                                                ),
                                                Row(
                                                    children: <Widget>[
                                                        Text('Buyer:',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16.0),),
                                                        Text(snapshot.data[i].buyerName,style: TextStyle(color: Colors.black,fontSize: 16.0),)
                                                    ],
                                                ),
                                                SingleChildScrollView(

                                                    scrollDirection: Axis.horizontal,
                                                    child: Row(
                                                        children: <Widget>[
                                                            Text('Location:',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16.0),),
                                                            Text(snapshot.data[i].buyerAddress,style: TextStyle(color: Colors.black,fontSize: 16.0),)
                                                        ],
                                                    ),
                                                ),
                                                snapshot.data[i].buyerType=='Consumer'?Container(height: 0.0,):Row(
                                                    children: <Widget>[
                                                        Text('New Price:',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16.0),),
                                                        Text(snapshot.data[i].newRate.toString()+'/Kg',style: TextStyle(color: Colors.black,fontSize: 16.0),)
                                                    ],
                                                ),
                                                Row(
                                                    children: <Widget>[
                                                        Text('Type:',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16.0),),
                                                        Text(snapshot.data[i].buyerType,style: TextStyle(color: Colors.black,fontSize: 16.0),)
                                                    ],
                                                ),

                                            ],
                                        ),
                                    ),
                                  ),
                                ),
                                iconBackground: Colors.green,

                            );

                        },
                        position: TimelinePosition.Left,
                        physics: BouncingScrollPhysics(),

                    );
                },
            ),
        ),
    );
  }
}
