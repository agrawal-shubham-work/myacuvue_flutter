import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/utilities/global_variable.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/main_upper_container_for_reward_and_cart.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final Color darkBlueColor = Color(0xFF013F7C);
  final Color lightRegularColor = Color(0xFF5F86B4);
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
        child: GlobalVariable.lifeStyleRewardList.length != 0
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
              ),
      ),
    );
  }

  Widget createCartList(int index) {
    return Column(
      children: <Widget>[
        Container(
          height: 150.0,
          margin: EdgeInsets.all(5.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Image.asset(
                        GlobalVariable.lifeStyleRewardList[index].productImage,
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
                      Text(GlobalVariable
                          .lifeStyleRewardList[index].productName),
                      Text(GlobalVariable
                          .lifeStyleRewardList[index].productPoints),
                      Text(
                        GlobalVariable.lifeStyleRewardList[index].productDesc,
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
          children: <Widget>[
            _createCartBtn('Remove', lightRegularColor),
            _createCartBtn('Update', darkBlueColor),
          ],
        )
      ],
    );
  }

  Widget _createCartBtn(String text, Color color) {
    return Expanded(
      flex: 1,
      child: Container(
        color: color,
        margin: EdgeInsets.all(5.0),
        child: FlatButton(
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
                _createCartBtn("Continue Browsing", darkBlueColor),
                GlobalVariable.lifeStyleRewardList.length != 0
                    ? _createCartBtn("Checkout", darkBlueColor)
                    : _createCartBtn("Checkout", lightRegularColor),
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
