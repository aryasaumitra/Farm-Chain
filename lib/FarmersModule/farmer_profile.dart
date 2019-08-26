import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class FarmerProfile extends StatefulWidget {
  @override
  _FarmerProfileState createState() => _FarmerProfileState();
}

class _FarmerProfileState extends State<FarmerProfile> {


    File _image;
    Future getImage() async{
        var image=await ImagePicker.pickImage(source: ImageSource.camera);
        setState(() {
          _image=image;
        });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.grey,
        appBar: AppBar(
            title: Text('Profile'),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Go Back',
                onPressed: (){
                    Navigator.pop(context);
                },
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
                          child:  _image==null? Image.asset('assets/image/farmer.png',width: 70.0,height: 70.0,):Image.file(_image),
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
                        child: Material(
                            child: InkWell(
                                onTap: getImage,
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
                                    child: Center(
                                      child: Text('Change Picture',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.black
                                          ),
                                      ),
                                    ),
                                ),
                            ),
                        )
                    ) ,
                ),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                        child: Material(
                            child: InkWell(
                                onTap: (){},
                                child: Container(
                                    decoration:  BoxDecoration(
                                        color: Color.fromRGBO(52, 152,219 , 1.0),
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
                                    child: Center(
                                        child: Text('SAVE',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                            ),
                                        ),
                                    ),
                                ),
                            ),
                        ),
                    ),
                ),
                Expanded(
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
