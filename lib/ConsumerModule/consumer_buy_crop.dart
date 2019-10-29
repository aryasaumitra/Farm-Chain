import 'package:agro_chain/APIEndpoints/OrdersAPI/order.dart';
import 'package:agro_chain/APIEndpoints/ProductAPI/product_model.dart';
import 'package:agro_chain/models/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class ConsumerBuyCrop extends StatefulWidget {
    final ProductDetail productDetail;
    ConsumerBuyCrop({Key key, @required this.productDetail}):super(key:key);
  @override
  _ConsumerBuyCropState createState() => _ConsumerBuyCropState(this.productDetail);
}

class _ConsumerBuyCropState extends State<ConsumerBuyCrop> {
     ProductDetail productDetail;
    final GlobalKey<FormBuilderState> _cropBuyKey=GlobalKey<FormBuilderState>();
    _ConsumerBuyCropState(ProductDetail productDetail){
        this.productDetail=productDetail;
    }
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
                'ORDER - '+this.productDetail.variety+' '+this.productDetail.name,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
            ),

        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                  Flexible(
                      flex: 2,
                    child: Container(
                        color:Color.fromRGBO(52, 152,219 , 1.0),
                        width: double.infinity,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(left:12.0),
                                    child: Text('Available:'+this.productDetail.quantity.toString()+'Kg',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.white
                                        ),
                                    ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left:12.0),
                                    child: Text('Price:'+this.productDetail.sellingPrice.toString()+'/Kg',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.white
                                        ),
                                    ),
                                ),
                                SizedBox(
                                    height: 20.0,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left:12.0),
                                    child: Text('Location:'+this.productDetail.ownerAddress,style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.white
                                    ),
                                    ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left:12.0,bottom: 10.0),
                                    child: Text('Owner:'+this.productDetail.ownerName,style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.white
                                    ),),
                                )
                            ],
                        ),
                    ),
                  ),
                  Flexible(
                      flex: 5,
                    child: Container(
                        width: double.infinity,
                        //color: Colors.grey,
                        child: SingleChildScrollView(
                          child: FormBuilder(
                              key: _cropBuyKey,
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
                                                  attribute: 'quantity',
                                                  keyboardType: TextInputType.number,
                                                  validators: [
                                                      FormBuilderValidators.required(),
                                                      FormBuilderValidators.numeric(),
                                                      // ignore: missing_return,
                                                          (val){

                                                          if(int.tryParse(val)>this.productDetail.quantity)
                                                              return "Cannot be larger than available quantity";

                                                      }
                                                  ],
                                                  decoration: InputDecoration(
                                                      labelText: 'Enter Quantity',
                                                      fillColor: Colors.white,
                                                      border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(10.0),
                                                          borderSide: BorderSide(),

                                                      ),
                                                      focusColor: Colors.white,
                                                      isDense: true,
                                                  ),
                                              ),
                                          ),
                                      ),
//                                  Padding(
//                                      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
//                                      child: Container(
//                                          //color: Colors.white,
//                                          decoration: BoxDecoration(
//                                              borderRadius: BorderRadius.circular(10.0),
//                                              color: Colors.white
//                                          ),
//                                          child: FormBuilderTextField(
//                                              attribute: 'newPrice',
//                                              keyboardType: TextInputType.number,
//                                              validators: [
//                                                  FormBuilderValidators.required(),
//                                                  FormBuilderValidators.numeric(),
//
//                                              ],
//                                              decoration: InputDecoration(
//                                                  labelText: 'Enter New Sale Price',
//                                                  fillColor: Colors.white,
//                                                  border: OutlineInputBorder(
//                                                      borderRadius: BorderRadius.circular(10.0),
//                                                      borderSide: BorderSide(),
//
//                                                  ),
//                                                  focusColor: Colors.white,
//                                                  isDense: true,
//                                              ),
//                                          ),
//                                      ),
//
//                                  ),
//                                  Padding(
//                                      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
//                                      child:Container(
//                                          //color: Colors.white,
//                                          decoration: BoxDecoration(
//                                              borderRadius: BorderRadius.circular(10.0),
//                                              color: Colors.white
//                                          ),
//                                          child: FormBuilderDropdown(
//                                              attribute: 'resale',
//                                              validators: [
//                                                  FormBuilderValidators.required(),
//                                                  //FormBuilderValidators.numeric(),
//                                              ],
//                                              decoration: InputDecoration(
//                                                  labelText: 'Resale',
//                                                  fillColor: Colors.white,
//                                                  border: OutlineInputBorder(
//                                                      borderRadius: BorderRadius.circular(10.0),
//                                                      borderSide: BorderSide()
//                                                  ),
//                                                  focusColor: Colors.white,
//                                                  isDense: true,
//                                              ),
//                                              items: ['TRUE','FALSE'].map((resale)=>DropdownMenuItem(
//                                                  value: resale.toLowerCase(),
//                                                  child: Text('$resale'),
//                                              )).toList(),
//                                          ),
//                                      ) ,
//                                  ),
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
                                                          child: Text('PAY',
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
                    ),
                  )

              ],
          ),
        ),
    );
  }
     _onSubmit() async{

         final userProfile=Provider.of<UserProfile>(context);
         _cropBuyKey.currentState.save();
         if(_cropBuyKey.currentState.validate()){
             print(_cropBuyKey.currentState.value);
             print("CROP ID:"+this.productDetail.cropId);
             //  print("OWNER ID:"+this.wholesalerCropDetail.owner.id);
             print('PRODUCT ID:'+this.productDetail.productId);

             Map<String ,dynamic> data=_cropBuyKey.currentState.value;
             data['id']=this.productDetail.productId;
             data['resale']=false;
             data['newPrice']=0;
             var val=await Order.addOrder(authToken: userProfile.authToken, data: data);
             print('val:'+val.toString());
             if(val==true){

                 Navigator.of(context).pop();
             }
             else{
                 print('Order Unsuccesful');
             }
             // print("Owner:"+this.wholesalerCropDetail.owner.toString());
         }
     }
}
