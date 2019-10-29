

import 'package:flutter/widgets.dart';

class UserProfile with ChangeNotifier{

    String _authToken;
    String _userType;
    String _mobileNumber;
    String _firstName;
    String _lastName;
    String _address;
    String _farmCity;
    String _farmState;
    int _orders=0;
    Image _userImage;



   String get authToken=>_authToken;
   String get userType=>_userType;
   String get mobileNumber=>_mobileNumber;
   String get firstName=>_firstName;
   String get lastName=>_lastName;
   String get address=>_address;
   String get farmCity=>_farmCity;
   String get farmState=>_farmState;
   int get orders=>_orders;
   Image get userImage=>_userImage;

   void addUserData({@required String userType,@ required String mobileNumber,String firstName="",String lastName="",String address="",String farmCity="",String farmState="",Image userImage} ){
    this._userType=userType;
    this._mobileNumber=mobileNumber;
    this._firstName=firstName;
    this._lastName=lastName;
    this._address=address;
    this._farmCity=farmCity;
    this._farmState=farmState;
    this._userImage=userImage;
    notifyListeners();

   }

    set authToken(String val){
       this._authToken=val;
       notifyListeners();
   }
    set orders(int val){
       _orders=val;
       notifyListeners();
    }

    void reset(){
       this._authToken=null;
       this._orders=0;
       this._farmState=null;
       this._userType=null;
       this._farmCity=null;
       this._address=null;
       this._mobileNumber=null;
       this._firstName=null;
       this._lastName=null;
       this._userImage=null;
       notifyListeners();

    }
}