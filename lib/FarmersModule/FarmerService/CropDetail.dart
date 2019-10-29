class CropDetail{

    String _dateAdded;
    String _id;
    String _name;
    String _quantity;
    String _price;
    String _grade;
    String _variety;
    String _owner;

    CropDetail(this._dateAdded, this._id, this._name, this._quantity,
        this._price, this._grade, this._variety, this._owner);

    String get variety => _variety;

    String get grade => _grade;

    String get name => _name;

    String get owner => _owner;

    String get price => _price;

    String get quantity => _quantity;

    String get id => _id;

    String get dateAdded => _dateAdded;


}