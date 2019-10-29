import 'dart:io';
import 'package:agro_chain/FarmersModule/FarmerService/CropDetail.dart';
import 'package:agro_chain/FarmersModule/FarmerService/farmerService.dart';
import 'package:agro_chain/models/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditCrop extends StatefulWidget {
    final CropDetail cropDetail;

    EditCrop({Key key , @required this.cropDetail}):super(key:key);
  @override
  _EditCropState createState() => _EditCropState(this.cropDetail);
}

class _EditCropState extends State<EditCrop> {

    CropDetail cropDetail;
    final GlobalKey<FormBuilderState> _cropKey= GlobalKey<FormBuilderState>();
    _EditCropState(CropDetail cropDetail){
        this.cropDetail=cropDetail;
    }
    File _image;
    Future getImage() async{
        var image=await ImagePicker.pickImage(source: ImageSource.gallery);
        setState(() {
            _image=image;
        });
    }

  @override
  Widget build(BuildContext context) {
      final  userProfile=Provider.of<UserProfile>(context);
      print(cropDetail.id);

    return Scaffold(
        appBar: AppBar(
            title: Text('Edit Crop',

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

        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                Flexible(
                    child: SingleChildScrollView(
                      child: FormBuilder(
                          key: _cropKey,
                          child: Column(
                              children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                          child: CircleAvatar(
                                              radius: 40.0,
                                              backgroundColor: Colors.white,
                                              child: _image==null?Image.asset('assets/image/cereal.png',width: 70.0,height: 70.0,):Image.file(_image),
                                          ),
                                      ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                                      child: FormBuilderTextField(
                                          attribute: 'name',
                                          validators: [
                                              FormBuilderValidators.required(errorText: 'Required')
                                          ],
                                          initialValue: cropDetail.name,
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
                                          initialValue: cropDetail.variety,
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
                                          readOnly: true,
                                          initialValue:cropDetail.quantity,
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
                                          initialValue: cropDetail.price,
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
                                          initialValue: cropDetail.grade,
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
                                      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
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
                                                      child: Text('EDIT CROP',
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
                )
            ],
        ),
    );
  }
  onSave() async{
        var userProfile=Provider.of<UserProfile>(context);
        _cropKey.currentState.save();
        if(_cropKey.currentState.validate()){
            print(_cropKey.currentState.value);
            print(userProfile.authToken);
            Map<String,String> data=_cropKey.currentState.value;
            data.remove('quantity');
            var response=await FarmerService.updateCrop(authToken:userProfile.authToken , cropId: cropDetail.id,data: data);
            print(response.body);
        }
  }
}
