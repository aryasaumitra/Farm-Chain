import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FarmerProfile extends StatefulWidget {
  @override
  _FarmerProfileState createState() => _FarmerProfileState();
}

class _FarmerProfileState extends State<FarmerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.grey,
        appBar: AppBar(
            title: Text('Profile'),
        ),
        drawer: Drawer(
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
                Expanded(
                    child: Center(
                      child: CircleAvatar(
                          radius: 40.0,
                          backgroundColor: Colors.white,
                          child: Image.asset('assets/image/farmer.png',width: 70.0,height: 70.0,),
                      ),
                    ),
                ),
                Expanded(
                    child:Padding(

                      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                      child: TextFormField(

                          decoration: InputDecoration(
                              labelText: 'Enter Name',
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(),

                              ),
                              focusColor: Colors.white,
                              isDense: true
                          ),
                          initialValue: "Arya Saumitra",
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.text,


                      ),
                    ) ,
                ),
                Expanded(
                    child:Padding(
                        padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Enter Phone',
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(),

                                ),
                                isDense: true
                            ),
                            initialValue: "7479970007",
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.text,


                        ),
                    ) ,
                ),
                Expanded(
                    child:Padding(
                        padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Enter Address',
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(),

                                ),
                                isDense: true
                            ),
                            initialValue: "Majitar Sikkim",
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.text,


                        ),
                    ) ,
                ),
                Expanded(
                    child:Padding(
                        padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Change Picture',
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(),

                                ),
                                isDense: true
                            ),
                            initialValue: "Change Picture",
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.text,


                        ),
                    ) ,
                ),

            ],
        ),
    );
  }
}
