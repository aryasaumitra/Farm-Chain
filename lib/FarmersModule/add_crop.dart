import 'dart:io';

import 'package:agro_chain/APIEndpoints/CropAPI/crop.dart';

import 'package:agro_chain/models/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
class AddCrop extends StatefulWidget {
  @override
  _AddCropState createState() => _AddCropState();
}

class _AddCropState extends State<AddCrop> {
    //final _formKey = GlobalKey<FormState>();
    final GlobalKey<FormBuilderState> _fbKey= GlobalKey<FormBuilderState>();
    File _image;

    Future getImageCamera() async{
        var image=await ImagePicker.pickImage(source: ImageSource.camera);
        setState(() {
            _image=image;
        });
    }

    Future getImageGallery() async{
        var image=await ImagePicker.pickImage(source: ImageSource.gallery);
        setState(() {
            _image=image;
        });
    }
    ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
      pr = ProgressDialog(context, type: ProgressDialogType.Normal,
          isDismissible: false,
          showLogs: false);
      pr.style(
          message: 'Please Wait...',
          progressWidget: CircularProgressIndicator(),
          backgroundColor: Colors.white
      );
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
       // resizeToAvoidBottomPadding: false,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

            Flexible(
                flex: 6,
              child: SingleChildScrollView(
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
                                padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                                child: FormBuilderTextField(
                                    attribute: 'variety',
                                    validators: [
                                        FormBuilderValidators.required(errorText: 'Required'),
                                        //FormBuilderValidators.numeric()
                                    ],
                                    decoration: InputDecoration(
                                        labelText: 'Variety',
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
                                padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
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
                                padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
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
                                padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0),
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
                            Row(
                                children: <Widget>[
                                    Flexible(
                                        child: Padding(
                                            padding: const EdgeInsets.only(left: 25.0,right: 3.0,top: 20.0,bottom: 10.0),
                                            child: Material(
                                                child: InkWell(
                                                    onTap: getImageCamera,
                                                    child: Container(
                                                        height: 50.0,
                                                        width: double.infinity,
                                                        // margin: const EdgeInsets.all(100.0),
                                                        decoration:  BoxDecoration(
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
                                                            child: Text('CHOOSE IMAGE from Camera',
                                                                style: TextStyle(
                                                                    fontSize: 12.0,
                                                                    color: Colors.black,
                                                                    fontWeight: FontWeight.bold
                                                                ),
                                                            ),
                                                        ),
                                                    ),
                                                ),
                                            ),
                                        ),
                                    ),
                                    Flexible(
                                        child: Padding(
                                            padding: const EdgeInsets.only(right: 25.0,top: 20.0,bottom: 10.0),
                                            child: Material(
                                                child: InkWell(
                                                    onTap: getImageGallery,
                                                    child: Container(
                                                        height: 50.0,
                                                        width: double.infinity,
                                                        // margin: const EdgeInsets.all(100.0),
                                                        decoration:  BoxDecoration(
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
                                                            child: Text('CHOOSE IMAGE from Gallery',
                                                                style: TextStyle(
                                                                    fontSize: 12.0,
                                                                    color: Colors.black,
                                                                    fontWeight: FontWeight.bold
                                                                ),
                                                            ),
                                                        ),
                                                    ),
                                                ),
                                            ),
                                        ),
                                    )
                                ],
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
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
            ),
            Flexible(
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

  onSave() async{
        var userProfile=Provider.of<UserProfile>(context);
        _fbKey.currentState.save();
        if(_fbKey.currentState.validate()){
            pr.show();
           // print(_fbKey.currentState.value);

//            var response=await FarmerService.addCrop(data: _fbKey.currentState.value, authToken: userProfile.authToken);
//            print(response.body);
//            print(response.statusCode);

            var resp=await Crop.addCrop(authToken: userProfile.authToken, data: _fbKey.currentState.value, file: _image);
            print(resp.statusCode);
            pr.dismiss();
            Navigator.of(context).pop();
            //print(_image);
        }
  }
}
