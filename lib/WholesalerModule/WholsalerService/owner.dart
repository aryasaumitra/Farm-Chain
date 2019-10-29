

class Owner{

    String _id;
    String _mobileNumber;
    String _userType;
    String _address;
    String _farmCity;
    String _farmState;
    String _firstName;
    String _lastName;

    Owner.name(this._id, this._mobileNumber, this._userType, this._address,
        this._farmCity, this._farmState, this._firstName, this._lastName);

    String get address=> _address+', '+_farmCity+', '+_farmState;
    String get name=> _firstName+' '+_lastName;
    String get userType=> _userType;

    String get mobileNumber => _mobileNumber;

    String get id => _id;


}