class OrderDetail{

    String _orderId;
    String _stockId;
    String _orderStatus;
    String _orderDate;
    String _cropName;
    String _cropGrade;
    String _cropVariety;
    String _ownerType;
    String _ownerFirstName;
    String _ownerLastName;
    String _buyerType;
    String _buyerFirstName;
    String _buyerLastName;
    int _quantity;
    int _sellingPrice;
    int _stockPrice;
    bool _orderReview;

    bool get orderReview => _orderReview;

    OrderDetail.name(this._orderId, this._stockId, this._orderStatus,
        this._orderDate, this._cropName, this._cropGrade, this._cropVariety,
        this._ownerType, this._ownerFirstName, this._ownerLastName,
        this._quantity, this._sellingPrice,this._buyerType,this._buyerFirstName,this._buyerLastName,this._orderReview);

    int get sellingPrice => _sellingPrice;

    int get stockPrice=>_stockPrice;

    String get buyerType=>_buyerType.toUpperCase();

    String get buyerName=>_buyerFirstName+' '+_buyerLastName;

    String get ownerName=>_ownerFirstName+' '+_ownerLastName;

    int get quantity => _quantity;

    String get ownerType => _ownerType.toUpperCase();

    String get cropVariety => _cropVariety[0].toUpperCase()+_cropVariety.substring(1);

    String get cropGrade => _cropGrade.toUpperCase();

    String get cropName => _cropName[0].toUpperCase()+_cropName.substring(1);

    String get orderDate => _orderDate.substring(0,10);

    String get orderStatus => _orderStatus.toUpperCase();

    String get stockId => _stockId;

    String get orderId => _orderId;


}