import 'package:agro_chain/APIEndpoints/OrdersAPI/order_model.dart';
import 'package:agro_chain/models/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ConsumerAddReview extends StatefulWidget {

    final OrderDetail orderDetail;
    ConsumerAddReview({Key key,@required this.orderDetail}):super(key:key);
  @override
  _ConsumerAddReviewState createState() => _ConsumerAddReviewState(this.orderDetail);
}

class _ConsumerAddReviewState extends State<ConsumerAddReview> {

    OrderDetail orderDetail;
    _ConsumerAddReviewState(OrderDetail orderDetail){
        this.orderDetail=orderDetail;
    }
    double rating=0;
    final GlobalKey<FormBuilderState> _cropReviewKey=GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(52, 152,219 , 1.0) ,
            elevation: 0.0,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Go Back',
                onPressed: (){
                    Navigator.pop(context);
                },
                color: Colors.white,
            ),
            title: Text(
                'ADD REVIEW-'+this.orderDetail.cropName,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
            ),

        ),
        body: SingleChildScrollView(
          child: FormBuilder(
              key: _cropReviewKey,
            child: Column(
                children: <Widget>[
                    SizedBox(
                        height: 20.0,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 25.0,right: 25.0,bottom: 10.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: FormBuilderTextField(
                                attribute: 'review',
                                keyboardType: TextInputType.multiline,
                                validators: [
                                    FormBuilderValidators.required(),
                                  //  FormBuilderValidators.numeric(),

                                ],
                                decoration: InputDecoration(
                                    labelText: 'Enter Review',
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide(),

                                    ),
                                    focusColor: Colors.white,
                                    isDense: true,
                                ),
                                minLines: 1,
                                maxLines: 8,
                            ),
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 25.0,right: 25.0,bottom: 10.0,top: 10.0),
                        child: RatingBar(
                            initialRating: 3,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal:4.0),
                            itemBuilder: (context,_)=>Icon(
                                Icons.star,
                                color: Colors.amber,
                            ),
                            onRatingUpdate: (rating){
                                this.rating=rating;
                            },
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                        child:  Material(
                            child: InkWell(
                                onTap: _onSubmit,
                                child: Container(
                                    height: 40.0,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
//                                                    color: Color
//                                                        .fromRGBO(
//                                                        52, 152, 219,
//                                                        1.0),
                                        color: Colors.green,
                                        borderRadius: BorderRadius
                                            .circular(8.0),

                                    ),
                                    child: Center(
                                        child: Text('ADD REVIEW',
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
  _onSubmit() {
      final userProfile=Provider.of<UserProfile>(context);
      _cropReviewKey.currentState.save();
      if(_cropReviewKey.currentState.validate()){
          Map<String,dynamic> data=_cropReviewKey.currentState.value;
          data['rating']=this.rating;
          data['orderId']=this.orderDetail.orderId;

          print(data);

          var val;
          //API CODE
          print('\nVal:'+val.toString());

          if(val==true){
              Navigator.of(context).pop();
          }
          else{
              print('error');
          }

      }
    }
}
