import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final GlobalKey<FormBuilderState> _loginKey=GlobalKey<FormBuilderState>();
 // final formkey=GlobalKey<FormState>();
 // final mobilecontroller=TextEditingController();
 // final passwordcontroller=TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
       // backgroundColor: Colors.grey,
       // resizeToAvoidBottomPadding: false,
        body: Column(
            children: <Widget>[
                Flexible(
                    flex: 4,
                    child:Container(
                        color: Color.fromRGBO(52, 152,219 , 1.0),
                        child: Center(
                            child: Image.asset('assets/image/cereal.png',width: 100.0,height: 100.0,),
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
                                            attribute: 'mobile',
                                            keyboardType: TextInputType.number,
                                            validators: [
                                                FormBuilderValidators.minLength(10),
                                                FormBuilderValidators.required()
                                            ],
                                            decoration: InputDecoration(
                                                labelText: 'Mobile',
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10.0),
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
                                            validators: [
                                                FormBuilderValidators.minLength(8),
                                                FormBuilderValidators.required()
                                            ],
                                            decoration: InputDecoration(
                                                labelText: 'Password',
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10.0),
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
                                                        color: Color.fromRGBO(52, 152,219 , 1.0),
                                                        borderRadius: BorderRadius.circular(8.0),

                                                    ),
                                                    child: Center(
                                                        child: Text( 'LOGIN',
                                                            style: TextStyle(
                                                                fontSize: 20.0,
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.white
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
                                                onTap: (){
                                                    Navigator.pushNamed(context, '/registerPage');
                                                },
                                                child: Container(
                                                    height: 40.0,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(8.0),

                                                    ),
                                                    child: Center(
                                                        child: Text( 'REGISTER',
                                                            style: TextStyle(
                                                                fontSize: 20.0,
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.black
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
  void _onSubmit(){

      _loginKey.currentState.save();
      //print(_loginKey.currentState.value);
     // if(_loginKey.currentState.validate()){
          Navigator.pushNamed(context, '/retailerDashboard');
      //}
      //if(formkey.currentState.validate()){
           // print(formkey.currentState.toString());
            //print(formkey.currentContext);
            //print(mobilecontroller.text);
            //print(passwordcontroller.text);
          //if(mobilecontroller.text == '7479970007'  && passwordcontroller.text=='qwerty123'){
      //        Navigator.pushNamed(context, '/farmerDashboard');
         // }
      //}
  }
}

