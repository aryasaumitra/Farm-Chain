import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final formkey=GlobalKey<FormState>();
  final mobilecontroller=TextEditingController();
  final passwordcontroller=TextEditingController();
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

                                child: Padding(
                                   // margin: EdgeInsetsGeometry,

                                    padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                                      child: TextFormField(
                                          //key: formkey,
                                          decoration: const InputDecoration(
                                             // icon: Icon(Icons.phone),
                                              labelText: 'Mobile',
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(),
                                              ),
                                              hasFloatingPlaceholder: true,
                                              isDense: true,
                                              focusColor: Colors.white,

                                          ),
                                          controller:mobilecontroller ,
                                          onSaved: (String value){
                                              print(value);
                                          },
                                          validator: (String value){
                                              return value.length<10 ? 'Enter 10-digit Mobile Number' :null;
                                          },
                                          keyboardType: TextInputType.number,
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
                                       // key: formkey,

                                        decoration: const InputDecoration(
                                            icon: Icon(Icons.fiber_pin),
                                            hintText: 'Password',
                                            border: InputBorder.none,


                                        ),
                                        controller:passwordcontroller ,
                                        onSaved: (String value){
                                            print(value);
                                        },
                                        validator: (String value){
                                            return value.length<8 ? 'Enter 8-digit Password' :null;
                                        },
                                        obscureText: true,
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
                                        onPressed: _onSubmit,
                                        textColor: Colors.white,
                                        elevation: 1.0,
                                        padding: const EdgeInsets.only(left: 120.0,right: 120.0),
                                        child: Text('LOGIN',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold
                                        ),textAlign: TextAlign.center,),
                                    ),
                                ),
                              Flexible(

                                  child: RaisedButton(

                                      color:Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0)
                                      ),
                                      onPressed: (){
                                          Navigator.pushNamed(context, '/registerPage');
                                      },
                                      textColor: Colors.white,
                                      elevation: 1.0,
                                      padding: const EdgeInsets.only(left: 100.0,right: 100.0),
                                      child: Text('REGISTER',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              color: Colors.black,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold
                                          ),textAlign: TextAlign.center,),
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
  void _onSubmit(){
      //if(formkey.currentState.validate()){
           // print(formkey.currentState.toString());
            //print(formkey.currentContext);
            //print(mobilecontroller.text);
            //print(passwordcontroller.text);
          //if(mobilecontroller.text == '7479970007'  && passwordcontroller.text=='qwerty123'){
              Navigator.pushNamed(context, '/farmerDashboard');
         // }
      //}
  }
}

