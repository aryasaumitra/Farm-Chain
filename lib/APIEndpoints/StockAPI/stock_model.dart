class StockDetail{

    String _date;
    String _stockId;
    String _stockType;
    String _ownerId;
    int _quantity;
    int _sellingPrice;
    String _cropId;
    String _cropName;
    String _cropVariety;
    String _cropGrade;

    StockDetail.name(this._date, this._stockId, this._stockType, this._ownerId,
        this._quantity, this._sellingPrice, this._cropId, this._cropName,
        this._cropVariety, this._cropGrade);

    String get cropGrade => _cropGrade.toUpperCase();

    String get cropVariety => _cropVariety[0].toUpperCase()+_cropVariety.substring(1);

    String get cropName => _cropName[0].toUpperCase()+_cropName.substring(1);

    String get cropId => _cropId;

    int get sellingPrice => _sellingPrice;

    int get quantity => _quantity;

    String get ownerId => _ownerId;

    String get stockType => _stockType.toUpperCase();

    String get stockId => _stockId;

    String get date => _date.substring(0,10);


}