import 'package:agro_chain/APIEndpoints/CropAPI/crop.dart';
import 'package:agro_chain/APIEndpoints/ProductAPI/product.dart';
import 'package:agro_chain/APIEndpoints/UserAPI/user.dart';
import 'package:agro_chain/ConsumerModule/consumer_buy_crop.dart';
import 'package:agro_chain/models/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:rating_bar/rating_bar.dart';

class ConsumerCropSearch extends StatefulWidget {
  @override
  _ConsumerCropSearchState createState() => _ConsumerCropSearchState();
}

class _ConsumerCropSearchState extends State<ConsumerCropSearch> {
    final GlobalKey<FormBuilderState> _cropSearchKey= GlobalKey<FormBuilderState>();
    String cropName;
    String cropVariety;
    String cropGrade;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Crop Listing'),
            backgroundColor: Color.fromRGBO(52, 152,219 , 1.0),
            elevation: 0.0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                    setState(() {
                        this.cropName=null;
                        this.cropVariety=null;
                        this.cropGrade=null;
                    });
                    Navigator.of(context).pop();
                },
            ),
        ),
        body: SingleChildScrollView(
            child: Column(

                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                    SearchContainer(),
                    SizedBox(
                        width: double.infinity,
                        height: 20.0,
                    ),
                    SearchResult(),
                ],
            ),
        ),
    );
  }
    // ignore: non_constant_identifier_names
    Widget SearchContainer(){
        final userProfile=Provider.of<UserProfile>(context);

        return Container(
            width: double.infinity,
            color: Color.fromRGBO(52, 152,219 , 1.0),
            child: Column(
                children: <Widget>[
                    SizedBox(
                        height: 10.0,
                    ),
                    FormBuilder(
                        key: _cropSearchKey,
                        child: Column(
                            children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                                    child:FutureBuilder(
                                        future: Crop.cropNames(authToken: userProfile.authToken),
                                        builder: (BuildContext context,AsyncSnapshot<List<String>> snapshot){
                                            if(!snapshot.hasData)
                                                return Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(10.0)
                                                    ),
                                                    child: FormBuilderTextField(
                                                        decoration: InputDecoration(
                                                            //labelText: 'Select Crop',
                                                            fillColor: Colors.white,
                                                            border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(10.0),
                                                                borderSide: BorderSide(),

                                                            ),
                                                            focusColor: Colors.white,
                                                            isDense: true,
                                                        ),
                                                        readOnly: true,
                                                        initialValue: 'Select Crop',

                                                    ),
                                                );
                                            return Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(10.0)
                                                ),
                                                child: FormBuilderDropdown(
                                                    attribute: 'cropName',
                                                    hint: Text('Select Crop'),
                                                    decoration: InputDecoration(
                                                        //labelText: 'Select Crop',

                                                        fillColor: Colors.white,
                                                        border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(10.0),
                                                            borderSide: BorderSide()
                                                        ),
                                                        focusColor: Colors.white,
                                                        isDense: true,
                                                    ),
                                                    validators: [FormBuilderValidators.required()],
                                                    items: snapshot.data.map((cropName)=>DropdownMenuItem(
                                                        value: cropName,
                                                        child: Text('$cropName'),
                                                    )).toList(),
                                                    onChanged: (dynamic){
                                                        _cropSearchKey.currentState.save();
                                                        print(_cropSearchKey.currentState.value['cropName']);
                                                        setState(() {
                                                            this.cropName=_cropSearchKey.currentState.value['cropName'];
                                                        });
                                                    },
                                                ),
                                            );
                                        },
                                    ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                                    child: FutureBuilder(
                                        future: Crop.cropVariety(authToken: userProfile.authToken, name: this.cropName),
                                        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot){
                                            if(!snapshot.hasData)
                                                return Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(10.0)
                                                    ),
                                                    child: FormBuilderTextField(
                                                        decoration: InputDecoration(
                                                         //   labelText: 'Select Variety',
                                                            fillColor: Colors.white,
                                                            border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(10.0),
                                                                borderSide: BorderSide(),

                                                            ),
                                                            focusColor: Colors.white,
                                                            isDense: true,
                                                        ),
                                                        readOnly: true,
                                                        initialValue: 'Select Variety',
                                                    ),
                                                );
                                            return Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(10.0)
                                                ),
                                                child: FormBuilderDropdown(
                                                    attribute: 'cropVariety',
                                                    hint: Text('Select Variety'),
                                                    decoration: InputDecoration(
                                                        //labelText: 'Select Variety',

                                                        fillColor: Colors.white,
                                                        border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(10.0),
                                                            borderSide: BorderSide()
                                                        ),
                                                        focusColor: Colors.white,
                                                        isDense: true,
                                                    ),
                                                    validators: [FormBuilderValidators.required()],
                                                    items: snapshot.data.map((cropVariety)=>DropdownMenuItem(
                                                        value: cropVariety,
                                                        child: Text('$cropVariety'),
                                                    )).toList(),
                                                    onChanged: (dynamic){
                                                        _cropSearchKey.currentState.save();
                                                        print(_cropSearchKey.currentState.value['cropVariety']);
                                                        setState(() {
                                                            this.cropVariety=_cropSearchKey.currentState.value['cropVariety'];
                                                        });
                                                    },
                                                ),
                                            );
                                        },
                                    ),
                                ),
                                Padding(
                                    padding:const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                                    child: FutureBuilder(
                                        future: Crop.cropGrade(authToken: userProfile.authToken, name: this.cropName, variety: this.cropVariety),
                                        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot){
                                            if(!snapshot.hasData)
                                                return Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(10.0)
                                                    ),
                                                    child: FormBuilderTextField(

                                                        decoration: InputDecoration(
                                                            // labelText: 'Select Grade',
                                                            fillColor: Colors.white,
                                                            border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(10.0),
                                                                borderSide: BorderSide(),

                                                            ),
                                                            focusColor: Colors.white,
                                                            isDense: true,
                                                        ),
                                                        readOnly: true,
                                                        initialValue: 'Select Grade',
                                                    ),
                                                );
                                            return Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(10.0)
                                                ),
                                                child: FormBuilderDropdown(
                                                    attribute: 'cropGrade',
                                                    hint: Text('Select Grade'),
                                                    decoration: InputDecoration(
                                                        // labelText: 'Select Grade',

                                                        fillColor: Colors.white,
                                                        border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(10.0),
                                                            borderSide: BorderSide()
                                                        ),
                                                        focusColor: Colors.white,
                                                        isDense: true,
                                                    ),
                                                    validators: [FormBuilderValidators.required()],
                                                    items: snapshot.data.map((cropGrade)=>DropdownMenuItem(
                                                        value: cropGrade,
                                                        child: Text('$cropGrade'),
                                                    )).toList(),
                                                    onChanged: (dynamic){
                                                        _cropSearchKey.currentState.save();
                                                        print(_cropSearchKey.currentState.value['cropGrade']);
//                                                    setState(() {
//                                                      this.cropGrade=_cropSearchKey.currentState.value['cropGrade'];
//                                                    });
                                                    },
                                                ),
                                            );
                                        },
                                    ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                                    child:   Material(
                                        child: InkWell(
                                            onTap: _onSubmit,
                                            child: Container(
                                                height: 40.0,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
//
                                                    // borderRadius: BorderRadius.circular(10.0),
                                                    color: Colors.green,
                                                ),
                                                child: Center(
                                                    child: Text('SEARCH',
                                                        style: TextStyle(
                                                            fontSize: 20.0,
                                                            fontWeight: FontWeight
                                                                .bold,
                                                            color: Colors
                                                                .white
                                                        ),
                                                    ),
                                                ),
                                            ),
                                        ),
                                    ),
                                )

                            ],
                        ),
                    )
                ],
            ),

        );
    }
    // ignore: non_constant_identifier_names
    Widget SearchResult(){
        final userProfile=Provider.of<UserProfile>(context);
        return Container(
            color: Colors.white,
            width: double.infinity,

            child: FutureBuilder(
                future: Product.getProduct(authToken: userProfile.authToken, name: this.cropName, variety: this.cropVariety, grade: this.cropGrade),

                builder: (BuildContext context,AsyncSnapshot snapshot){
                    if(!snapshot.hasData)
                        return Container(

                            child: Center(
                                child: Text('Search Crop...'),
                            ),
                        );

                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context,int index){
                            print(snapshot.data);
                            return Padding(
                                padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 5.0,bottom: 5.0),
                                child: Card(
                                    elevation: 5.0,
                                    color: Color.fromRGBO(52, 152,219 , 1.0),

                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(52, 152,219 , 1.0),
                                            borderRadius: BorderRadius.circular(8.0),
                                            boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    offset: Offset(0.0,10.0),
                                                    blurRadius: 5.0
                                                ),
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    offset: Offset(0.0,-10.0),
                                                    blurRadius: 5.0
                                                )

                                            ]
                                        ),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                                Padding(
                                                    padding: const EdgeInsets.only(top: 10.0,left: 15.0),
                                                    child: Text(snapshot.data[index].variety+' '+snapshot.data[index].name,
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 24.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),),
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.only(top: 4.0,left: 15.0),
                                                    child: Text('Available:'+snapshot.data[index].quantity.toString()+' Kg',
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),
                                                    ),
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.only(top: 4.0,left: 15.0),
                                                    child: Text('Price:'+snapshot.data[index].sellingPrice.toString()+' Rs/Kg',
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),
                                                    ),
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.only(top:4.0,left: 15.0),
                                                    child: Text('Date Added: '+snapshot.data[index].date,
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),
                                                    ),
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.only(top: 4.0,left: 15.0),
                                                    child: Text('Location: '+ snapshot.data[index].ownerAddress,
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),
                                                    ),
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.only(top: 4.0,left: 15.0),
                                                    child: Text(snapshot.data[index].ownerType+': '+snapshot.data[index].ownerName,
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.white,
                                                            wordSpacing: 2.0
                                                        ),
                                                    ),
                                                ),
                                                FutureBuilder(
                                                    future: User.getReview(authToken: userProfile.authToken, sellerId: snapshot.data[index].ownerId),
                                                    builder: (context,snapshot){
                                                        if(snapshot.hasData){
                                                            // print(snapshot.data);
                                                            //double rating=snapshot.data.toDouble();
                                                            return RatingBar.readOnly(
                                                                initialRating: snapshot.data.toDouble(),
                                                                isHalfAllowed: true,
                                                                filledIcon: Icons.star,
                                                                filledColor: Colors.amber,
                                                                emptyIcon: Icons.star_border,
                                                                emptyColor: Colors.amber,
                                                                halfFilledIcon: Icons.star_half,
                                                                halfFilledColor: Colors.amber,
                                                                maxRating: 5,
                                                            );
                                                        }
                                                        return RatingBar.readOnly(
                                                            initialRating: 0.0,
                                                            maxRating: 5,
                                                            halfFilledIcon: Icons.star_half,
                                                            halfFilledColor: Colors.amber,
                                                            filledIcon: Icons.star,
                                                            filledColor: Colors.amber,
                                                            emptyIcon: Icons.star_border,
                                                            emptyColor: Colors.amber,
                                                        );
                                                    },
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                                                    child:  Material(
                                                        child: InkWell(
                                                            onTap: (){
//                                                            Navigator.push(context,
//                                                            MaterialPageRoute(
//                                                                builder: (context)=>WholesalerBuyCrop(wholesalerCropDetail: snapshot.data[index],)
//                                                            )
//                                                            );
                                                                Navigator.push(context, MaterialPageRoute(
                                                                    builder: (context)=>ConsumerBuyCrop(productDetail: snapshot.data[index])
                                                                ));
                                                            },
                                                            child: Container(
                                                                height: 40.0,
                                                                width: double.infinity,
                                                                decoration: BoxDecoration(
//                                                    color: Color
//                                                        .fromRGBO(
//                                                        52, 152, 219,
//                                                        1.0),
                                                                    color: Colors.orange,
//                                                                borderRadius: BorderRadius
//                                                                    .circular(8.0),

                                                                ),
                                                                child: Center(
                                                                    child: Text('BUY',
                                                                        style: TextStyle(
                                                                            fontSize: 20.0,
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            color: Colors
                                                                                .white
                                                                        ),
                                                                    ),
                                                                ),
                                                            ),
                                                        ),
                                                    ),
                                                )

                                            ],
                                        ),
                                    ),
                                ),
                            );
                        }
                    );

                },
            ),

        );
    }
    _onSubmit() {

        if(_cropSearchKey.currentState.validate()) {
            _cropSearchKey.currentState.save();
            setState(() {
                this.cropName=_cropSearchKey.currentState.value['cropName'];
                this.cropVariety=_cropSearchKey.currentState.value['cropVariety'];
                this.cropGrade=_cropSearchKey.currentState.value['cropGrade'];
            });
        }
    }
}
