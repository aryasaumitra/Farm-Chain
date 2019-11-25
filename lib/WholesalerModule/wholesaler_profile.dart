import 'dart:io';

import 'package:agro_chain/UserServices/userService.dart';
import 'package:agro_chain/models/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class WholesalerProfile extends StatefulWidget {
  @override
  _WholesalerProfileState createState() => _WholesalerProfileState();
}

class _WholesalerProfileState extends State<WholesalerProfile> {
    final GlobalKey<FormBuilderState> _profileKey= GlobalKey<FormBuilderState>();
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
                                                  labelText: 'State',
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
                                                  labelText: 'City',
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
