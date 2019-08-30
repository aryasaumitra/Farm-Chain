import 'package:flutter/material.dart';


class ConsumerOrders extends StatefulWidget {
  @override
  _ConsumerOrdersState createState() => _ConsumerOrdersState();
}

class _ConsumerOrdersState extends State<ConsumerOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Orders'),
            elevation: 0.0,
            backgroundColor: Color.fromRGBO(52, 152,219 , 1.0),
        ),
    );
  }
}
