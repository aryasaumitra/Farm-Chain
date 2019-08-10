import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  final formkey=GlobalKey<FormState>();
  final mobileNumberController=TextEditingController();
  final passwordController=TextEditingController();
  final rePasswordController=TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
            children: <Widget>[
                Flexible(
                    flex: 3,
                    child:Container(
                        color: Color.fromRGBO(52, 152,219 , 1.0),
                        child: Center(
                            child: Image.asset('assets/image/cereal.png',width: 100.0,height: 100.0,),
                        ),
                    )
                ),

                Flexible(
                    flex: 2,
                    child: Container(
                        color: Colors.white,
                        child: Form(
                            key: formkey,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: <Widget>[
                                    Flexible(

                                        child: Card(
                                            // margin: EdgeInsetsGeometry,

                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15.0)
                                            ),
                                            elevation: 1.0,
                                            child: TextFormField(
                                                //key: formkey,
                                                decoration: const InputDecoration(
                                                    icon: Icon(Icons.phone),
                                                    hintText: 'Mobile',
                                                    border: InputBorder.none,
                                                    hasFloatingPlaceholder: true

                                                ),
                                                controller:mobileNumberController ,
                                                onSaved: (String value){
                                                    print(value);
                                                },
                                                validator: (String value){
                                                    return value.length<10 ? 'Enter 10-digit Mobile Number' :null;
                                                },
                                                keyboardType: TextInputType.number,
                                                //initialValue: '',
                                                //autovalidate: true,
                                            ),

                                        ),
                                    ),
                                    Flexible(
                                        child: Card(
                                            margin: const EdgeInsets.only(left:10.0,right: 10.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15.0),

                                            ),
                                            elevation: 1.0,
                                            child: TextFormField(


                                                decoration: const InputDecoration(
                                                    icon: Icon(Icons.fiber_pin),
                                                    hintText: 'Password',
                                                    border: InputBorder.none,


                                                ),
                                                controller:passwordController ,
                                                onSaved: (String value){
                                                    print(value);
                                                },
                                                validator: (String value){
                                                    return value.length<8 ? 'Enter 8-digit Password' :null;
                                                },
                                                obscureText: true,
                                                //autovalidate: true,
                                                onEditingComplete: (){
                                                    print(passwordController.text);
                                                },
                                                //initialValue: '',

                                            ),
                                        ),
                                    ),
                                    Flexible(
                                        child: Card(
                                            margin: const EdgeInsets.only(left:10.0,right: 10.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15.0),

                                            ),
                                            elevation: 1.0,
                                            child: TextFormField(


                                                decoration: const InputDecoration(
                                                    icon: Icon(Icons.fiber_pin),
                                                   // labelText: 'Re-enter Password',
                                                    hintText: 'Re-enter Password',
                                                    border: InputBorder.none,


                                                ),
                                                controller:rePasswordController ,
                                                onSaved: (String value){
                                                    print(value);
                                                },
                                                validator: (String value){
                                                    print(value);
                                                    return  value!=passwordController.text ? 'Password Do Not Match' :null;
                                                },
                                                obscureText: true,
                                                //autovalidate: true,
                                                //initialValue: '',
                                                onEditingComplete: (){
                                                    print(rePasswordController.text);
                                                },

                                            ),
                                        ),
                                    ),
                                    SizedBox(
                                        width: 10.0,
                                        height: 10.0,
                                    ),
                                    Flexible(

                                        child: RaisedButton(

                                            color:Color.fromRGBO(52, 152,219 , 1.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15.0)
                                            ),
                                            onPressed: _onRegister,
                                            textColor: Colors.white,
                                            elevation: 1.0,
                                            padding: const EdgeInsets.only(left: 120.0,right: 120.0),
                                            child: Text('REGISTER',
                                                style: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold
                                                ),textAlign: TextAlign.center,),
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
  void _onRegister(){
//        print(passwordController.text);
//        print(rePasswordController.text);

            if (formkey.currentState.validate()) {
                print("Register Successful");
                Navigator.pop(context);
            }

  }
}
