import 'package:flutter/material.dart';


class ConsumerDashboard extends StatefulWidget {
  @override
  _ConsumerDashboardState createState() => _ConsumerDashboardState();
}

class _ConsumerDashboardState extends State<ConsumerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Consumer'),
            backgroundColor: Color.fromRGBO(52, 152,219 , 1.0),
            elevation: 0.0,
        ),
        drawer:Drawer(
            child: ListView(
                children: <Widget>[
                    ListTile(
                        title: Text('ITEM 1'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: (){
                            Navigator.pop(context);
                        },
                    )
                ],
            ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 20.0,bottom: 10.0),
                    child: Material(

                        child: InkWell(
                            onTap: (){
                               // Navigator.pushNamed(context, '/orders');
                            },
                            child: Container(
                                height: 100.0,
                                child: Row(
                                    children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child:Image.asset('assets/image/corn.png',width: 70.0,height: 70.0,) ,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Text('View Products',
                                                style:TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold
                                                ) ,),

                                        ),
                                    ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0.0,15.0),
                                            blurRadius: 15.0

                                        ),
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0.0,-10.0),
                                            blurRadius: 15.0

                                        )

                                    ]
                                ),
                            ),
                        ),
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 20.0,bottom: 10.0),
                    child: Material(

                        child: InkWell(
                            onTap: (){
                                // Navigator.pushNamed(context, '/orders');
                            },
                            child: Container(
                                height: 100.0,
                                child: Row(
                                    children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child:Image.asset('assets/image/checklist.png',width: 70.0,height: 70.0,) ,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Text('View Orders',
                                                style:TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold
                                                ) ,),

                                        ),
                                    ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0.0,15.0),
                                            blurRadius: 15.0

                                        ),
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0.0,-10.0),
                                            blurRadius: 15.0

                                        )

                                    ]
                                ),
                            ),
                        ),
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 20.0,bottom: 10.0),
                    child: Material(

                        child: InkWell(
                            onTap: (){
                                //print('pressed');
                                Navigator.pushNamed(context, '/consumerTrackback');
                            },
                            child: Container(
                                height: 100.0,
                                child: Row(
                                    children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child:Image.asset('assets/image/blockchain.png',width: 70.0,height: 70.0,) ,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Text('Trackback',
                                                style:TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold
                                                ) ,),

                                        ),
                                    ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0.0,15.0),
                                            blurRadius: 15.0

                                        ),
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0.0,-10.0),
                                            blurRadius: 15.0

                                        )

                                    ]
                                ),
                            ),
                        ),
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 20.0,bottom: 10.0),
                    child: Material(

                        child: InkWell(
                            onTap: (){
                                // Navigator.pushNamed(context, '/orders');
                            },
                            child: Container(
                                height: 100.0,
                                child: Row(
                                    children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child:Image.asset('assets/image/resume.png',width: 70.0,height: 70.0,) ,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Text('View Profile',
                                                style:TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold
                                                ) ,),

                                        ),
                                    ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0.0,15.0),
                                            blurRadius: 15.0

                                        ),
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0.0,-10.0),
                                            blurRadius: 15.0

                                        )

                                    ]
                                ),
                            ),
                        ),
                    ),
                ),
            ],
        ),

    );
  }
}
