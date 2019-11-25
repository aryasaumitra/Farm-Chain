class StockTrackBackDetails{

//    String _dateCreated;
//    String _stockId;
//    String _productType;
//    int _sellingPrice;
//    String _ownerUserType;
//    String _ownerAddress;
//    String _ownerCity;
//    String _ownerState;
//    String _ownerFirstName;
//    String _ownerLastName;
//    String _ownerType;
//
//    StockTrackBackDetails.name(this._dateCreated, this._stockId,
//        this._productType, this._sellingPrice, this._ownerUserType,
//        this._ownerAddress, this._ownerCity, this._ownerState,
//        this._ownerFirstName, this._ownerLastName,this._ownerType);
//
//    String get ownerUserType => _ownerUserType[0].toUpperCase()+_ownerUserType.substring(1);
//
//    int get sellingPrice => _sellingPrice;
//
//    String get ownerType=>_ownerType[0].toUpperCase()+_ownerType.substring(1);
//
//    String get productType => _productType;
//
//    String get stockId => _stockId;
//
//    String get dateCreated => _dateCreated.substring(0,10);
//
//    String get ownerName => _ownerFirstName+' '+_ownerLastName;
//
//    String get ownerAddress => _ownerAddress+','+_ownerCity+','+_ownerState;
//


    int _newRate;
    int _purchaseRate;
    String _buyerFirstName;
    String _buyerLastName;
    String _buyerType;
    String _sellerType;
    String _buyerAddress;
    String _buyerCity;
    String _buyerState;
    String _sellerFirstName;
    String _sellerLastName;
    String _sellerAddress;
    String _sellerCity;
    String _sellerState;


    StockTrackBackDetails.name(this._newRate, this._purchaseRate,
        this._buyerFirstName, this._buyerLastName, this._buyerType,
        this._sellerType, this._buyerAddress, this._buyerCity, this._buyerState,
        this._sellerFirstName, this._sellerLastName, this._sellerAddress,
        this._sellerCity, this._sellerState);

    String get buyerType=>_buyerType[0].toUpperCase()+_buyerType.substring(1);

    String get sellerType=>_sellerType[0].toUpperCase()+_sellerType.substring(1);

    String get sellerName=>_sellerFirstName+' '+_sellerLastName;

    String get sellerAddress=>_sellerAddress+','+_sellerCity+','+_sellerState;

    String get buyerAddress=>_buyerAddress+','+_buyerCity+','+_buyerState;

    int get newRate => _newRate;

    int get purchaseRate => _purchaseRate;

    String get buyerName=>_buyerFirstName+' '+_buyerLastName;


}