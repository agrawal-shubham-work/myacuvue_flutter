import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/background_image_widget.dart';

class PromotionBanner extends StatelessWidget {
  static const String routeName = '/promotionbanner';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotion Banner'),
      ),
      body: BackgroundImage("images/promotionbanner.jpg"),
    );
  }
}
