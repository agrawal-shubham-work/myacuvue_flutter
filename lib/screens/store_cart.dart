import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/utilities/global_variable.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/main_upper_container_for_reward_and_cart.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
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
        color: Colors.red,
      ),
    );
  }

  Widget _lowerContainer() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(border: Border()),
            child: Column(
              children: <Widget>[],
            ),
          )
        ],
      ),
    );
  }
}
