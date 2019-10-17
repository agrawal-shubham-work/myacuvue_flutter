import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/lifestyle_reward_model.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';

class ProductDetails extends StatefulWidget {
  final LifestyleRewardModel modelList;

  ProductDetails(this.modelList);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.modelList.productName),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 150.0,
              width: 150.0,
              margin: EdgeInsets.symmetric(vertical: 30.0),
              child: Image.asset(
                widget.modelList.productImage,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "${widget.modelList.productPoints} Points",
              style: kRewardTerms,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              color: Color(0xFf013F7C),
              child: FlatButton(
                child: Text(
                  'Add to cart',
                  style: kRewardBtn,
                ),
              ),
            ),
            Text(
              'Validity : Oct 17, 2019',
              style: kStoreName,
            )
          ],
        ),
      ),
    );
  }
}
