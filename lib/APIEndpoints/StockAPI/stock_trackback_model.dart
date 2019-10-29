class StockTrackBackDetails{

    String _dateCreated;
    String _stockId;
    String _productType;
    int _sellingPrice;
    String _ownerUserType;
    String _ownerAddress;
    String _ownerCity;
    String _ownerState;
    String _ownerFirstName;
    String _ownerLastName;
    String _ownerType;

    StockTrackBackDetails.name(this._dateCreated, this._stockId,
        this._productType, this._sellingPrice, this._ownerUserType,
        this._ownerAddress, this._ownerCity, this._ownerState,
        this._ownerFirstName, this._ownerLastName,this._ownerType);

    String get ownerUserType => _ownerUserType[0].toUpperCase()+_ownerUserType.substring(1);

    int get sellingPrice => _sellingPrice;

    String get ownerType=>_ownerType[0].toUpperCase()+_ownerType.substring(1);

    String get productType => _productType;

    String get stockId => _stockId;

    String get dateCreated => _dateCreated.substring(0,10);

    String get ownerName => _ownerFirstName+' '+_ownerLastName;

    String get ownerAddress => _ownerAddress+','+_ownerCity+','+_ownerState;




}