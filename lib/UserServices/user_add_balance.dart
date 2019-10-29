import 'package:agro_chain/UserServices/userService.dart';
import 'package:agro_chain/models/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class UserAddBalance extends StatefulWidget {
  @override
  _UserAddBalanceState createState() => _UserAddBalanceState();
}

class _UserAddBalanceState extends State<UserAddBalance> {
    final GlobalKey<FormBuilderState> _balanceKey= GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    //  final userProfile=Provider.of<UserProfile>(context);


    return Scaffold(
        appBar: AppBar(
            title: Text('ADD BALANCE'),
            backgroundColor:Color.fromRGBO(52, 152,219 , 1.0) ,
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
        body: FormBuilder(
            key: _balanceKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                      child: FormBuilderTextField(
                          attribute: 'amount',
                          validators: [
                              FormBuilderValidators.required(errorText: 'Required'),
                              FormBuilderValidators.numeric()
                          ],
                          decoration: InputDecoration(
                              labelText: 'Amount',
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
                      child: Material(
                          child: InkWell(
                              onTap: onSubmit,
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
                                      child: Text('ADD AMOUNT',
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
    );

  }
  onSubmit() async{

        _balanceKey.currentState.save();
        if(_balanceKey.currentState.validate()){
            print(_balanceKey.currentState.value);
            final userProfile=Provider.of<UserProfile>(context);
            var authToken=userProfile.authToken;
            try {
                var response = await UserService.updateBalance(
                    authToken: authToken, data: _balanceKey.currentState.value);

                if(response.statusCode==200){
                    Navigator.pop(context);
                }
                else{
                    print("ERROR");
                    print(response.body);
                }
            }catch(e){
                print(e);
            }
        }

  }
}
