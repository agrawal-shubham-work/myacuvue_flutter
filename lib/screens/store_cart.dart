import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/models/cart_model.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/utilities/get_current_user_id.dart';
import 'package:my_acuvue_flutter/utilities/global_variable.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/main_upper_container_for_reward_and_cart.dart';

class Cart extends StatefulWidget {
  String userId;

  Cart(this.userId);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool _anchorToBottom = false;

  // instance of util class

  String selectedValue = "1";

  @override
  void initState() {
    super.initState();
    print(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Column(
        children: <Widget>[
          UpperContainer(),
          _mainCartContainer(),
          _lowerContainer(),
        ],
      ),
    );
  }

  Widget _mainCartContainer() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey),
          ),
        ),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child:
            /*GlobalVariable.lifeStyleRewardList.length != 0
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: GlobalVariable.lifeStyleRewardList.length,
                itemBuilder: (BuildContext context, int index) {
                  return createCartList(index);
                },
              )
            : Container(
                child: Center(
                  child: Text('Your cart is empty'),
                ),
              ),*/
             FirebaseAnimatedList(
          key:  ValueKey<bool>(_anchorToBottom),
          query: FirebaseDatabase.instance
              .reference()
              .child("cart")
              .child(widget.userId),
          reverse: _anchorToBottom,
          sort: _anchorToBottom
              ? (DataSnapshot a, DataSnapshot b) => b.key.compareTo(a.key)
              : null,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            return  SizeTransition(
              sizeFactor: animation,
              child: createCartList(snapshot),
            );
          },
        ),
      ),
    );
  }

  Widget createCartList(DataSnapshot snapshot) {
    CartModel model = CartModel.fromSnapshot(snapshot);
    String Quantity;
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Card(
        elevation: 8,
        child: Column(
          children: <Widget>[
            Container(
              height: 150.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: Image.network(
                            /*GlobalVariable.lifeStyleRewardList[index].imageUrl,*/
                            model.imageUrl,
                            fit: BoxFit.cover,
                          ))),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                              /*GlobalVariable
                              .lifeStyleRewardList[index].productName*/
                              model.productName),
                          Text(
                              /*GlobalVariable
                              .lifeStyleRewardList[index].productPoints*/
                              model.productPoints),
                          Text(
                            /*GlobalVariable
                                .lifeStyleRewardList[index].productDesc*/
                            model.productDesc,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0),
                          padding: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Qnty'),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10.0),
                                child: DropdownButton<String>(
                                  style: TextStyle(
                                    color: Color(0xFf013F7C),
                                  ),
                                  value:
                                      "${/*GlobalVariable.lifeStyleRewardList[index].productQuantity*/ model.productQuantity}",
                                  items: quantityList.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String value) {
                                    setState(() {
                                      /*GlobalVariable.lifeStyleRewardList[index]
                                          .productQuantity */
                                      FirebaseDatabase.instance
                                          .reference()
                                          .child("cart")
                                          .child(widget.userId)
                                          .child(model.id)
                                          .update(<String, dynamic>{
                                        "productQuantity": value,
                                      });
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              /*GlobalVariable.lifeStyleRewardList
                                  .removeAt(index);*/
                              FirebaseDatabase.instance
                                  .reference()
                                  .child("cart")
                                  .child(widget.userId)
                                  .child(model.id)
                                  .remove();
                            });
                          },
                          child: Icon(
                            Icons.delete_forever,
                            color: Color(0xFF013F7C),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _createCartBtn(String text, Color color, Function onTap) {
    return Expanded(
      flex: 1,
      child: Container(
        color: color,
        margin: EdgeInsets.all(5.0),
        child: FlatButton(
          onPressed: onTap,
          child: Text(
            text,
            style: kRewardBtn,
          ),
        ),
      ),
    );
  }

  Widget _lowerContainer() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Column(
              children: <Widget>[
                lower_container_row('Total points to be redeemed', '0'),
                lower_container_row('Balance points after redemption', '0'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                _createCartBtn("Continue Browsing", darkBlueColor, () {
                  Navigator.pop(context);
                }),
                GlobalVariable.lifeStyleRewardList.length != 0
                    ? _createCartBtn("Checkout", darkBlueColor, () {})
                    : _createCartBtn("Checkout", lightRegularColor, () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class lower_container_row extends StatelessWidget {
  final String text, points;

  lower_container_row(this.text, this.points);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Text(
              text,
              style: kCartPointsText,
            ),
          ),
          Expanded(
            child: Text(
              points,
              style: kCartPointsText,
            ),
          )
        ],
      ),
    );
  }
}
