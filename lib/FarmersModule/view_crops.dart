import 'package:agro_chain/APIEndpoints/StockAPI/stock.dart';

import 'package:agro_chain/models/userProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewCrops extends StatefulWidget {
  @override
  _ViewCropsState createState() => _ViewCropsState();
}

class _ViewCropsState extends State<ViewCrops> {

    //List<CropDetails> cropList=CropDetails.getCropList;

  @override
  Widget build(BuildContext context) {
      final userProfile=Provider.of<UserProfile>(context);
     // print(userProfile.authToken);
//      var list=FarmerService.getCropList(authToken:userProfile.authToken );
//      print(list);
    return Scaffold(
        appBar: AppBar(
            title: Text('Crops Listings',

            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white
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
            actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    tooltip: 'Add Crops',
                    //hoverColor: Colors.black,
                    iconSize: 45.0,
                    onPressed: (){
                        Navigator.pushNamed(context, '/farmerAddCrop');
                    },
                )
            ],
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

                                                ListTile(
                                                    leading: CircleAvatar(
                                                        backgroundImage: NetworkImage('http://farmchain.rishavanand.com:3000/stock/'+snapshot.data[index].stockId+'/photo',headers: {
                                                            'Authorization':userProfile.authToken
                                                        }),
                                                    ),
                                                    title: Text(snapshot.data[index].cropVariety+' '+snapshot.data[index].cropName,
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 24.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),
                                                    ),
                                                    subtitle: Text('Stock ID:'+snapshot.data[index].stockId,
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),
                                                    ),
                                                ),
//                                                Padding(
//                                                    padding: const EdgeInsets.only(top:4.0,left: 15.0),
//                                                    child: Text(snapshot.data[index].cropVariety+' '+snapshot.data[index].cropName,
//                                                        style: TextStyle(
//                                                            fontWeight: FontWeight.bold,
//                                                            fontSize: 24.0,
//                                                            color: Colors.white,
//                                                            wordSpacing: 2.0
//                                                        ),
//                                                    ),
//                                                ),
//                                                Padding(
//                                                    padding: const EdgeInsets.only(top:4.0,left:15.0),
//                                                    child: Text('Stock ID:'+snapshot.data[index].stockId,
//                                                        style: TextStyle(
//                                                            fontSize: 18.0,
//                                                            color: Colors.white,
//                                                            wordSpacing: 2.0
//                                                        ),
//                                                    ),
//                                                ),
                                                SizedBox(
                                                    height: 10.0,
                                                ),
                                                Padding(
                                                    padding:const EdgeInsets.only(top:4.0,left:15.0),
                                                    child: Text('Available:'+snapshot.data[index].quantity.toString()+'Kg',
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),
                                                    ),
                                                ),
                                                Padding(
                                                    padding:const EdgeInsets.only(top:4.0,left:15.0),
                                                    child: Text('Price: Rs.'+snapshot.data[index].sellingPrice.toString()+'/Kg',
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),
                                                    ),
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.only(top:4.0,left: 15.0,bottom: 10.0),
                                                    child: Text('Grade:'+snapshot.data[index].cropGrade,
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),
                                                    ),
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


}
