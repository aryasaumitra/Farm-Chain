import 'dart:convert';


import 'package:agro_chain/LoginModule/login_service.dart';
import 'package:agro_chain/models/userProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

    final GlobalKey<FormBuilderState> _loginKey = GlobalKey<FormBuilderState>();


    // final formkey=GlobalKey<FormState>();
    // final mobilecontroller=TextEditingController();
    // final passwordcontroller=TextEditingController();
    ProgressDialog pr;
    void _showDialogFetchUser(){
        showDialog(context: context,
            barrierDismissible: false,
            builder: (BuildContext context){
                return AlertDialog(
                    title: Row(
                        children: <Widget>[
                            Icon(Icons.warning),
                            SizedBox(
                                width: 20.0,
                            ),
                            Text('Server Issue')
                        ],
                    ),
                    content: Text('Unable to Fetch User Details'),
                    elevation: 10.0,
                    actions: <Widget>[
                        FlatButton(
                            child: Text('CLOSE'),
                            onPressed: ()
                            {
                                Navigator.of(context).pop();
                            },
                        )
                    ],
                );
            }

        );
    }
    void _showDialogIncorrectUser(){
        showDialog(context: context,
            barrierDismissible: false,
            builder: (BuildContext context){
                return AlertDialog(
                    title: Row(
                        children: <Widget>[
                            Icon(Icons.warning),
                            SizedBox(
                                width: 20.0,
                            ),
                            Text('Incorrect User')
                        ],
                    ),
                    content: Text('Please Enter Correct Credentials'),
                    elevation: 10.0,
                    actions: <Widget>[
                        FlatButton(
                            child: Text('CLOSE'),
                            onPressed: ()
                            {
                                Navigator.of(context).pop();
                                },
                        )
                    ],
                );
            }

        );
    }

    @override
    Widget build(BuildContext context) {
       // _loginKey.currentState.reset();
        pr = ProgressDialog(context, type: ProgressDialogType.Normal,
            isDismissible: false,
            showLogs: false);
        pr.style(
            message: 'Please Wait...',
            progressWidget: CircularProgressIndicator(),
            backgroundColor: Colors.white
        );
        return Scaffold(
            // backgroundColor: Colors.grey,
            // resizeToAvoidBottomPadding: false,

            body: Column(
                children: <Widget>[
                    Flexible(
                        flex: 4,
                        child: Container(
                            color: Color.fromRGBO(52, 152, 219, 1.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                    child: Image.asset(
                                        'assets/image/cereal.png', width: 100.0,
                                        height: 100.0,),
                                ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Center(
                                      child: Text('FARMCHAIN',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 30.0
                                        ),
                                      ),
                                  )
                              ],
                            ),
                        )
                    ),
                    Flexible(
                        flex: 3,
                        child: SingleChildScrollView(
                            child: FormBuilder(
                                key: _loginKey,
                                child: Column(
                                    children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: FormBuilderTextField(
                                                attribute: 'mobileNumber',
                                                initialValue: null,
                                                keyboardType: TextInputType
                                                    .number,
                                                validators: [
                                                    FormBuilderValidators
                                                        .minLength(10),
                                                    FormBuilderValidators
                                                        .required()
                                                ],
                                                decoration: InputDecoration(
                                                    labelText: 'Mobile',
                                                    fillColor: Colors.white,
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius
                                                            .circular(10.0),
                                                        borderSide: BorderSide()
                                                    ),
                                                    focusColor: Colors.white,
                                                    isDense: true,
                                                ),
                                            ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: FormBuilderTextField(
                                                attribute: 'password',
                                                initialValue: null,
                                                validators: [
                                                    FormBuilderValidators
                                                        .minLength(8),
                                                    FormBuilderValidators
                                                        .required()
                                                ],
                                                obscureText: true,
                                                decoration: InputDecoration(
                                                    labelText: 'Password',
                                                    fillColor: Colors.white,
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius
                                                            .circular(10.0),
                                                        borderSide: BorderSide()
                                                    ),
                                                    focusColor: Colors.white,
                                                    isDense: true,

                                                ),
                                            ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Material(
                                                child: InkWell(
                                                    onTap: _onSubmit,
                                                    child: Container(
                                                        height: 40.0,
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            color: Color
                                                                .fromRGBO(
                                                                52, 152, 219,
                                                                1.0),
                                                            borderRadius: BorderRadius
                                                                .circular(8.0),

                                                        ),
                                                        child: Center(
                                                            child: Text('LOGIN',
                                                                style: TextStyle(
                                                                    fontSize: 20.0,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    color: Colors
                                                                        .white
                                                                ),
                                                            ),
                                                        ),
                                                    ),
                                                ),
                                            ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Material(
                                                child: InkWell(
                                                    onTap: () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            '/registerPage');
                                                    },
                                                    child: Container(
                                                        height: 40.0,
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius
                                                                .circular(8.0),

                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                                'REGISTER',
                                                                style: TextStyle(
                                                                    fontSize: 20.0,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    color: Colors
                                                                        .black
                                                                ),
                                                            ),
                                                        ),
                                                    ),
                                                ),
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ),
                    )

                ],
            ),
        );
    }

    void _onSubmit() async {
        var userProfile=Provider.of<UserProfile>(context);
        Image userImage;
        _loginKey.currentState.save();
        //print(_loginKey.currentState.value);
        if (_loginKey.currentState.validate()) {
            pr.show();
            Map<dynamic, dynamic> data = _loginKey.currentState.value;
            // print(data);
            data['mobileNumber'] = '+91' + data['mobileNumber'];
            // print(data);

            var response = await LoginService.userLogin(data);
            //print(val);
            if (response.statusCode == 200) {
                print(response.body);
                var decodeResponse = jsonDecode(response.body);
               // print(decodeResponse);
//          print(val['payload']);
//          print(val['payload']['token']);
                userProfile.authToken=decodeResponse['payload']['token'];
                print(userProfile.authToken);
                if(pr.isShowing()){
                    pr.update(
                        message: 'Few More Seconds...'
                    );
                }

                var userProfileResponse = await LoginService.userProfile(
                    decodeResponse['payload']['token']);
                var userProfilePhoto=await LoginService.userPhoto(decodeResponse['payload']['token']);
                if(userProfilePhoto.statusCode==200){
                    //print(userProfilePhoto.body);
                     userImage=Image.network(userProfilePhoto.body);


//                    var userProfilePhotoDecoded=jsonDecode(userProfilePhoto.body);
//                    //print(userProfilePhotoDecoded);
                }
                if (userProfileResponse.statusCode == 200) {
                    var userProfileDecoded = jsonDecode(userProfileResponse.body);
                   // print(userProfileDecoded);
                    userProfile.addUserData(
                        userType: userProfileDecoded['payload']['profile']['userType'],
                        mobileNumber:userProfileDecoded['payload']['profile']['mobileNumber'],
                        address: userProfileDecoded['payload']['profile']['address'],
                        farmCity: userProfileDecoded['payload']['profile']['farmCity'],
                        farmState: userProfileDecoded['payload']['profile']['farmState'],
                        firstName: userProfileDecoded['payload']['profile']['firstName'],
                        lastName: userProfileDecoded['payload']['profile']['lastName'],
                        userImage: userImage
                    );

                    //print(userProfileDecoded['payload']['profile']['userType']);
                    String userDashboard=LoginService.userDashboard(userProfileDecoded['payload']['profile']['userType']);
                    pr.dismiss();
                    _loginKey.currentState.reset();
                    Navigator.pushNamed(context, userDashboard);
                }

                else{
                    pr.dismiss();
                    _showDialogFetchUser();
                }
            }
            else {
                pr.dismiss();
                print(response.statusCode);
                print(response.body);
                print("Login ERROR");
                _showDialogIncorrectUser();

            }
        }
        else{
            print('Wrong Details');
        }
    }
}
