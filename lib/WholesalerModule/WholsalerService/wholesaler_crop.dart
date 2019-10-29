
import 'owner.dart';

class WholesalerCropDetail{
    String _dateAdded;
    String _id;
    String _name;
    int _quantity;
    String _price;
    String _grade;
    String _variety;
    Owner _owner;

    WholesalerCropDetail.name    (this._dateAdded, this._id, this._name,
        this._quantity, this._price, this._grade, this._variety, this._owner);

    String get ownerId => _owner.id;

    String get ownerName=> _owner.name;

    String get ownerMobileNumber=>_owner.mobileNumber;

    String get ownerUserType=>_owner.userType;

    String get ownerAddress=>_owner.address;

    String get variety => _variety;

    String get grade => _grade;

    String get price => _price;

    int get quantity => _quantity;

    String get name => _name;

    String get id => _id;

    String get dateAdded => _dateAdded;


}