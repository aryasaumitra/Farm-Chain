import 'package:flutter/material.dart';

class ConsumerTrackBack extends StatefulWidget {
  @override
  _ConsumerTrackBackState createState() => _ConsumerTrackBackState();
}

class _ConsumerTrackBackState extends State<ConsumerTrackBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:Text('Choose Order'),
            elevation: 0.0,
            backgroundColor: Color.fromRGBO(52, 152,219 , 1.0),
        ),
    );
  }
}
