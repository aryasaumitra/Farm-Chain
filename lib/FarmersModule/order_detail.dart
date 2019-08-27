class OrderDetail{
    String orderName;
    String orderPrice;
    String orderQuantity;
    String orderDate;
    String orderBuyer;
    String orderContactNumber;
    String orderStatus;

    OrderDetail(this.orderName, this.orderPrice, this.orderQuantity,
        this.orderDate, this.orderBuyer, this.orderContactNumber,
        this.orderStatus);

    static List<OrderDetail> getOrderList=[
        OrderDetail('Basmati Rice','Rs.20/Kg','5kg','5 Aug','Big Bazar','9931373456','PENDING COLLECTION'),
        OrderDetail('Basmati Rice','Rs.30/Kg','3kg','5 Aug','Reliance Fresh','9835173132','COLLECTED')
    ];

}