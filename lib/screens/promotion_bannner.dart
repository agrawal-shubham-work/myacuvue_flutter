import 'package:flutter/material.dart';

class PromotionBanner extends StatelessWidget {
  static const String routeName = '/promotionbanner';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotion Banner'),
      ),
      body: Image.asset(
        "images/promotionbanner.jpg",
        fit: BoxFit.fill,
      ),
    );
  }
}
