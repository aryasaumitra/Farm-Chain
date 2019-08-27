import 'package:agro_chain/FarmersModule/crop_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewCrops extends StatefulWidget {
  @override
  _ViewCropsState createState() => _ViewCropsState();
}

class _ViewCropsState extends State<ViewCrops> {
    List<CropDetails> cropList=CropDetails.getCropList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Crops',

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
                        Navigator.pushNamed(context, '/addCrop');
                    },
                )
            ],
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Expanded(
                    flex: 6,
                  child: ListView.builder(
                      scrollDirection:Axis.vertical ,
                      itemCount: cropList.length,
                      itemBuilder:( context, index){
                          return Padding(
                            padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 20.0,bottom: 10.0),
                            child: Container(
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
                              child: ListTile(
                                  contentPadding: const EdgeInsets.all(5.0),
                                  leading: CircleAvatar(

                                  ),
                                  title: Text(cropList[index].cropName,style: TextStyle(fontWeight: FontWeight.bold),),
                                  subtitle: Text('Qty:'+cropList[index].cropQuantity+'\nPrice:'+cropList[index].cropPrice+'\nGrade:'+cropList[index].cropGrade),
                                  isThreeLine: true,
                                  trailing: IconButton(icon:Icon(Icons.edit),tooltip: 'Edit Crop',),
                                  onTap: (){

                                  },

                              ),
                            ),
                          );
                      } ,

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
