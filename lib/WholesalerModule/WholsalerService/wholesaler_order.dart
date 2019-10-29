class WholesalerOrder{

    String _orderDate;
    String _orderStatus;
    String _orderId;
    String _cropId;
    String _cropName;
    String _cropVariety;
    String _cropGrade;
    String _ownerFirstName;
    String _ownerLastName;
    int _quantity;
    int _newPrice;
    String _buyerId;
    int _orderCost;


    WholesalerOrder.name(this._orderDate, this._orderStatus, this._orderId,
        this._cropId, this._cropName, this._cropVariety, this._cropGrade,
        this._ownerFirstName, this._ownerLastName, this._quantity,
        this._newPrice, this._buyerId, this._orderCost);

    String get cropName=>_cropVariety+' '+_cropName;

    String get ownerName=> _ownerFirstName+' '+_ownerLastName;

    String get cropGrade => _cropGrade;

    String get orderDate => _orderDate;

    String get orderStatus => _orderStatus;

    int get orderCost => _orderCost;

    String get buyerId => _buyerId;

    int get newPrice => _newPrice;

    int get quantity => _quantity;

    String get cropId => _cropId;

    String get orderId => _orderId;


}