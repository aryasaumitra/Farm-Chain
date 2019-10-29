
class ProductDetail{
    String _productId;
    String _cropId;
    String _name;
    String _variety;
    String _grade;
    String _date;
    int _quantity;
    int _sellingPrice;
    String _ownerFirstName;
    String _ownerLastName;
    String _ownerCity;
    String _ownerAddress;
    String _ownerState;
    String _ownerType;

    ProductDetail.name(this._productId, this._cropId, this._name, this._variety,
        this._grade, this._date, this._quantity, this._sellingPrice,
        this._ownerFirstName, this._ownerLastName, this._ownerCity,
        this._ownerAddress, this._ownerState,this._ownerType);

    int get sellingPrice => _sellingPrice;

    int get quantity => _quantity;

    String get ownerType=>_ownerType[0].toUpperCase()+_ownerType.substring(1);

    String get date => _date.substring(0,10);

    String get grade => _grade.toUpperCase();

    String get variety => _variety[0].toUpperCase()+_variety.substring(1);

    String get name => _name[0].toUpperCase()+_name.substring(1);

    String get cropId => _cropId;

    String get productId => _productId;

    String get ownerName => _ownerFirstName+' '+_ownerLastName;

    String get ownerAddress => _ownerAddress+', '+_ownerCity+', '+_ownerState;


}