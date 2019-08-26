import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
class AddCrop extends StatefulWidget {
  @override
  _AddCropState createState() => _AddCropState();
}

class _AddCropState extends State<AddCrop> {
    final _formKey = GlobalKey<FormState>();
    final GlobalKey<FormBuilderState> _fbKey= GlobalKey<FormBuilderState>();
    File _image;
    Future getImage() async{
        var image=await ImagePicker.pickImage(source: ImageSource.gallery);
        setState(() {
            _image=image;
        });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Add Crop'),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Go Back',
                onPressed: (){
                    Navigator.pop(context);
                },
            ),
        ),
        resizeToAvoidBottomPadding: false,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
//                Expanded(
//                  child: Form(
//                      key: _formKey,
//                      child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: <Widget>[
//                                Flexible(
//                                    child: Padding(
//                                        padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
//                                        child: TextFormField(
//                                            validator: (value){
//                                                if(value.isEmpty){
//                                                    return 'Please enter some text';
//                                                }
//                                                return null;
//                                            },
//                                            decoration: InputDecoration(
//                                                labelText: 'Name',
//                                                fillColor: Colors.white,
//                                                border: OutlineInputBorder(
//                                                    borderRadius: BorderRadius.circular(10.0),
//                                                    borderSide: BorderSide(),
//
//                                                ),
//                                                focusColor: Colors.white,
//                                                isDense: true
//                                            ),
//                                            //initialValue: "Arya Saumitra",
//                                            textAlign: TextAlign.start,
//                                            keyboardType: TextInputType.text,
//
//
//                                        ),
//                                    ),
//                                ),
//
//                          ],
//                      ),
//                  ),
//                ),
            Expanded(
                flex: 6,
              child: FormBuilder(
                  key: _fbKey,

                  child: Column(
                      children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 20.0,bottom: 10.0),
                            child: FormBuilderTextField(
                                attribute: 'name',
                                validators: [
                                    FormBuilderValidators.required(errorText: 'Required')
                                ],
                                decoration: InputDecoration(
                                    labelText: 'Name',
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide()
                                    ),
                                    focusColor: Colors.white,
                                    isDense: true,
                                ),
                                keyboardType: TextInputType.text,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 20.0,bottom: 10.0),
                              child: FormBuilderTextField(
                                  attribute: 'quantity',
                                  validators: [
                                      FormBuilderValidators.required(errorText: 'Required'),
                                      FormBuilderValidators.numeric()
                                  ],
                                  decoration: InputDecoration(
                                      labelText: 'Quantity(Kg)',
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide()
                                      ),
                                      focusColor: Colors.white,
                                      isDense: true,
                                  ),
                                  keyboardType: TextInputType.number,
                              ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 20.0),
                              child: FormBuilderTextField(
                                  attribute: 'price',
                                  validators: [
                                      FormBuilderValidators.required(errorText: 'Required'),
                                      FormBuilderValidators.numeric()
                                  ],
                                  decoration: InputDecoration(
                                      labelText: 'Price (per Kg)',
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide()
                                      ),
                                      focusColor: Colors.white,
                                      isDense: true,
                                  ),
                                  keyboardType: TextInputType.number,
                              ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 20.0),
                              child: FormBuilderDropdown(
                                  attribute: 'grade',
                                  decoration: InputDecoration(
                                      labelText: 'Grade',
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide()
                                      ),
                                      focusColor: Colors.white,
                                      isDense: true,
                                  ),
                                  validators: [FormBuilderValidators.required()],
                                  items: ['A','B','C','D'].map((grade)=>DropdownMenuItem(
                                      value: grade,
                                      child: Text('$grade'),
                                  )).toList(),
                              ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 20.0,bottom: 10.0),
                              child: Material(
                                  child: InkWell(
                                      onTap: getImage,
                                      child: Container(
                                          height: 50.0,
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
                                          child: Center(
                                              child: Text('ADD IMAGE',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                              ),
                                          ),
                                      ),
                                  ),
                              )
                          ) ,
                          Padding(
                              padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 20.0,bottom: 10.0),
                              child: Material(
                                  child: InkWell(
                                      onTap: onSave,
                                      child: Container(
                                          height: 50.0,
                                         width: double.infinity,
                                         // margin: const EdgeInsets.all(100.0),
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
                                              child: Text('ADD CROP',
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
                          )

                      ],
                  ),
              ),
            ),
            Expanded(
                flex: 1,
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

  onSave(){
        _fbKey.currentState.save();
        if(_fbKey.currentState.validate()){
            print(_fbKey.currentState.value);
            print(_image);
        }
  }
}
