import 'package:flutter/material.dart';

class RetailerDashboard extends StatefulWidget {
  @override
  _RetailerDashboardState createState() => _RetailerDashboardState();
}

class _RetailerDashboardState extends State<RetailerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Retailer'),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Flexible(
                    flex: 2,
                    child: Container(
                        color: Color.fromRGBO(52, 152,219 , 1.0),
                        child: Column(
                            children: <Widget>[
                                Flexible(
                                    flex: 2,
                                    child: Container(
                                        child: Center(
                                            child: CircleAvatar(
                                                radius: 60.0,
                                                backgroundColor: Colors.white,
                                                child: Text('12',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(52, 152, 219, 1.0),
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 60.0,

                                                    ),),
                                            ),
                                        ),
                                    ),
                                ),
                                Flexible(
                                    flex: 1,
                                    child: Row(
                                        children: <Widget>[
                                            Expanded(
                                                flex:1,
                                                child: Padding(
                                                    padding: const EdgeInsets.only(top: 20.0,right: 10.0),
                                                    child: Image.asset('assets/image/cereal.png',width: 70.0,height: 70.0,),
                                                ),
                                            ),
                                            Expanded(
                                                flex: 2,
                                                child: Center(
                                                    child: Text('ORDERS',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 30.0
                                                        ),
                                                        textAlign: TextAlign.justify,
                                                    ),
                                                ),
                                            ),
                                            Expanded(
                                                flex: 1,

                                                child:Padding(
                                                    padding: const EdgeInsets.only(top: 20.0,left: 10.0),
                                                    child: Image.asset('assets/image/cereal.png',width: 70.0,height: 70.0,),
                                                ) ,
                                            )
                                        ],
                                    ),
                                )
                            ],
                        ),
                    ),
                ),
                Flexible(
                    flex: 3,
                    child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
                                    child: Material(

                                        child: InkWell(
                                            onTap: (){
                                                //Navigator.pushNamed(context, '/viewCrops');
                                            },
                                            child: Container(
                                                height: 80.0,
                                                child: Row(
                                                    children: <Widget>[
                                                        Expanded(
                                                            flex: 1,
                                                            child:Image.asset('assets/image/corn.png',width: 70.0,height: 70.0,) ,
                                                        ),
                                                        Expanded(
                                                            flex: 2,
                                                            child: Text('View Crop Listings',
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
                                    padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
                                    child: Material(

                                        child: InkWell(
                                            onTap: (){
                                                // Navigator.pushNamed(context, '/orders');
                                            },
                                            child: Container(
                                                height: 80.0,
                                                child: Row(
                                                    children: <Widget>[
                                                        Expanded(
                                                            flex: 1,
                                                            child:Image.asset('assets/image/factory.png',width: 70.0,height: 70.0,) ,
                                                        ),
                                                        Expanded(
                                                            flex: 2,
                                                            child: Text('View Stock',
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
                                    padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
                                    child: Material(

                                        child: InkWell(
                                            onTap: (){
                                                // Navigator.pushNamed(context, '/farmerProfile');
                                            },
                                            child: Container(
                                                height: 80.0,
                                                child: Row(
                                                    children: <Widget>[
                                                        Expanded(
                                                            flex: 1,
                                                            child:Image.asset('assets/image/checklist.png',width: 70.0,height: 70.0,) ,
                                                        ),
                                                        Expanded(
                                                            flex: 2,
                                                            child: Text('View orders',
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
                                    padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
                                    child: Material(

                                        child: InkWell(
                                            onTap: (){
                                                // Navigator.pushNamed(context, '/farmerProfile');
                                            },
                                            child: Container(
                                                height: 80.0,
                                                child: Row(
                                                    children: <Widget>[
                                                        Expanded(
                                                            flex: 1,
                                                            child:Image.asset('assets/image/resume.png',width: 70.0,height: 70.0,) ,
                                                        ),
                                                        Expanded(
                                                            flex: 2,
                                                            child: Text('View profile',
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
                    ),
                )
            ],
        ),
    );
  }
}
