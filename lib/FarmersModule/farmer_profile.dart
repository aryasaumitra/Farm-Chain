import 'dart:io';

import 'package:agro_chain/UserServices/userService.dart';
import 'package:agro_chain/models/userProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class FarmerProfile extends StatefulWidget {
  @override
  _FarmerProfileState createState() => _FarmerProfileState();
}

class _FarmerProfileState extends State<FarmerProfile> {

    final GlobalKey<FormBuilderState> _profileKey= GlobalKey<FormBuilderState>();
    File _image;
    Future getImage() async{
        var image=await ImagePicker.pickImage(source: ImageSource.camera);
        setState(() {
          _image=image;
        });
    }
  @override
  Widget build(BuildContext context) {
        final userProfile=Provider.of<UserProfile>(context);

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
      //  resizeToAvoidBottomPadding: false,
//        body: Column(
//
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//                Expanded(
//                    child: Center(
//                      child: CircleAvatar(
//                          radius: 40.0,
//                          backgroundColor: Colors.white,
//                          child:  _image==null? userProfile.userImage:Image.file(_image),
//                      ),
//                    ),
//                ),
//                Expanded(
//                    child:Padding(
//
//                      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
//                      child: TextFormField(
//
//                          decoration: InputDecoration(
//                              labelText: 'Enter Name',
//                              fillColor: Colors.white,
//                              border: OutlineInputBorder(
//                                  borderRadius: BorderRadius.circular(10.0),
//                                  borderSide: BorderSide(),
//
//                              ),
//                              focusColor: Colors.white,
//                              isDense: true
//                          ),
//                          initialValue: "Arya Saumitra",
//                          textAlign: TextAlign.start,
//                          keyboardType: TextInputType.text,
//
//
//                      ),
//                    ) ,
//                ),
//                Expanded(
//                    child:Padding(
//                        padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
//                        child: TextFormField(
//                            decoration: InputDecoration(
//                                labelText: 'Enter Phone',
//                                fillColor: Colors.white,
//                                border: OutlineInputBorder(
//                                    borderRadius: BorderRadius.circular(10.0),
//                                    borderSide: BorderSide(),
//
//                                ),
//                                isDense: true
//                            ),
//                            initialValue: "7479970007",
//                            textAlign: TextAlign.start,
//                            keyboardType: TextInputType.text,
//
//
//                        ),
//                    ) ,
//                ),
//                Expanded(
//                    child:Padding(
//                        padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
//                        child: TextFormField(
//                            decoration: InputDecoration(
//                                labelText: 'Enter Address',
//                                fillColor: Colors.white,
//                                border: OutlineInputBorder(
//                                    borderRadius: BorderRadius.circular(10.0),
//                                    borderSide: BorderSide(),
//
//                                ),
//                                isDense: true
//                            ),
//                            initialValue: "Majitar Sikkim",
//                            textAlign: TextAlign.start,
//                            keyboardType: TextInputType.text,
//
//
//                        ),
//                    ) ,
//                ),
//                Expanded(
//                    child:Padding(
//                        padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
//                        child: Material(
//                            child: InkWell(
//                                onTap: getImage,
//                                child: Container(
//                                    decoration: BoxDecoration(
//                                color: Colors.white,
//                                borderRadius: BorderRadius.circular(8.0),
//                                boxShadow: [
//                                    BoxShadow(
//                                        color: Colors.black12,
//                                        offset: Offset(0.0,15.0),
//                                        blurRadius: 15.0
//                                    ),
//                                    BoxShadow(
//                                        color: Colors.black12,
//                                        offset: Offset(0.0,-10.0),
//                                        blurRadius: 15.0
//                                    )
//                                        ]
//                                    ),
//                                    child: Center(
//                                      child: Text('Change Picture',
//                                          style: TextStyle(
//                                              fontSize: 20.0,
//                                              color: Colors.black
//                                          ),
//                                      ),
//                                    ),
//                                ),
//                            ),
//                        )
//                    ) ,
//                ),
//                Expanded(
//                    child: Padding(
//                        padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
//                        child: Material(
//                            child: InkWell(
//                                onTap: (){},
//                                child: Container(
//                                    decoration:  BoxDecoration(
//                                        color: Color.fromRGBO(52, 152,219 , 1.0),
//                                        borderRadius: BorderRadius.circular(8.0),
//                                        boxShadow: [
//                                            BoxShadow(
//                                                color: Colors.black12,
//                                                offset: Offset(0.0,15.0),
//                                                blurRadius: 15.0
//
//                                            ),
//                                            BoxShadow(
//                                                color: Colors.black12,
//                                                offset: Offset(0.0,-10.0),
//                                                blurRadius: 15.0
//
//                                            )
//
//                                        ]
//                                    ),
//                                    child: Center(
//                                        child: Text('SAVE',
//                                            style: TextStyle(
//                                                fontSize: 20.0,
//                                                color: Colors.white,
//                                                fontWeight: FontWeight.bold
//                                            ),
//                                        ),
//                                    ),
//                                ),
//                            ),
//                        ),
//                    ),
//                ),
//                Expanded(
//                    child: Row(
//                        children: <Widget>[
//                                Expanded(
//                                    flex: 1,
//                                    child: Padding(
//                                        padding: const EdgeInsets.only(top: 20.0,right: 10.0),
//                                        child: Image.asset('assets/image/cereal.png',width: 70.0,height: 70.0,),
//                                    ),
//                                ),
//                                Expanded(
//                                    flex: 2,
//                                    child: SizedBox(
//                                        width: 70.0,
//                                        height: 70.0,
//                                    ),
//                                ),
//                                Expanded(
//                                    flex: 1,
//                                    child: Padding(
//                                        padding: const EdgeInsets.only(top: 20.0,right: 10.0),
//                                        child: Image.asset('assets/image/cereal.png',width: 70.0,height: 70.0,),
//                                    ),
//                                )
//                        ],
//                    ),
//                )
//
//            ],
//        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                Flexible(
                    flex: 6,
                    child: SingleChildScrollView(
                      child: FormBuilder(
                          key: _profileKey,
                          child: Column(
                              children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: CircleAvatar(
                                            radius: 40.0,
                                            backgroundColor: Colors.white,
                                            child:  _image==null? Image.network('http://farmchain.rishavanand.com:3000/user/photo',headers: {"Authorization":"${userProfile.authToken}"},scale: 1.0,):Image.file(_image),
                                        ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                                      child: FormBuilderTextField(
                                          attribute: 'firstName',
                                          validators: [
                                              FormBuilderValidators.required(errorText: 'Required')
                                          ],
                                          decoration: InputDecoration(
                                              labelText: 'First Name',
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide()
                                              ),
                                              focusColor: Colors.white,
                                              isDense: true,

                                          ),
                                          initialValue: userProfile.firstName,
                                          keyboardType: TextInputType.text,
                                      ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                                      child: FormBuilderTextField(
                                          attribute: 'lastName',
                                          validators: [
                                              FormBuilderValidators.required(errorText: 'Required')
                                          ],

                                          decoration: InputDecoration(
                                              labelText: 'Last Name',
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide()
                                              ),
                                              focusColor: Colors.white,
                                              isDense: true,

                                          ),
                                          initialValue: userProfile.lastName,
                                          keyboardType: TextInputType.text,

                                      ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                                      child: FormBuilderTextField(
                                          attribute: 'farmState',
                                          validators: [
                                              FormBuilderValidators.required(errorText: 'Required')
                                          ],
                                          decoration: InputDecoration(
                                              labelText: 'Farm State',
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide()
                                              ),
                                              focusColor: Colors.white,
                                              isDense: true,

                                          ),
                                          initialValue: userProfile.farmState,
                                          keyboardType: TextInputType.text,
                                      ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                                      child: FormBuilderTextField(
                                          attribute: 'farmCity',
                                          validators: [
                                              FormBuilderValidators.required(errorText: 'Required')
                                          ],

                                          decoration: InputDecoration(
                                              labelText: 'Farm City',
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide()
                                              ),
                                              focusColor: Colors.white,
                                              isDense: true,

                                          ),
                                          initialValue: userProfile.farmCity,
                                          keyboardType: TextInputType.text,

                                      ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                                      child: FormBuilderTextField(
                                          attribute: 'address',
                                          validators: [
                                              FormBuilderValidators.required(errorText: 'Required')
                                          ],
                                          decoration: InputDecoration(
                                              labelText: 'Address',
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide()
                                              ),
                                              focusColor: Colors.white,
                                              isDense: true,

                                          ),
                                          initialValue: userProfile.address,
                                          keyboardType: TextInputType.text,
                                      ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                                      child: FormBuilderTextField(
                                          attribute: 'mobileNumber',
                                          validators: [
                                              FormBuilderValidators.required(errorText: 'Required')
                                          ],
                                          readOnly: true,

                                          decoration: InputDecoration(
                                              labelText: 'Mobile Number',
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide()
                                              ),
                                              focusColor: Colors.white,
                                              isDense: true,

                                          ),
                                          initialValue: userProfile.mobileNumber,
                                          keyboardType: TextInputType.text,

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
                                                      child: Text('CHOOSE IMAGE',
                                                          style: TextStyle(
                                                              fontSize: 20.0,
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                      ),
                                                  ),
                                              ),
                                          ),
                                      ),
                                  ),
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
                                  )
                              ],
                          ),
                      ),
                    ),
                ),
                Flexible(
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
  onSave()async{
        final userProfile=Provider.of<UserProfile>(context);
        _profileKey.currentState.save();
        if(_profileKey.currentState.validate()){
            print(_profileKey.currentState.value);

            if(_image!=null){
                var response=await UserService.updatePhoto(authToken: userProfile.authToken, file: _image);
               // print(response.statusCode);
            }

            Map<String,String> data=_profileKey.currentState.value;
            data.remove('mobileNumber');
            var response=await UserService.updateProfile(data: data, authToken: userProfile.authToken);

            if(response.statusCode==200){
                Navigator.pop(context);
            }
            else{
                print(response.statusCode);
                print(response.body);

            }
        }
  }
}
