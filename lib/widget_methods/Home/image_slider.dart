import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/screens/membership.dart';
import 'package:my_acuvue_flutter/screens/promotion_bannner.dart';
import 'package:my_acuvue_flutter/screens/promotions_and_events_web.dart';
import 'package:my_acuvue_flutter/screens/refer_and_earn.dart';

class CreateImageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        width: double.infinity,
        child: Carousel(
          images: [
            AssetImage("images/solace_banner.png"),
            AssetImage("images/promotions1.jpg"),
            AssetImage("images/promotions2.jpg"),
            AssetImage("images/promotions3.jpg"),
            AssetImage("images/promotions5.jpg"),
          ],
          onImageTap: (index) {
            openNewPageForSelectedImage(index, context);
          },
          boxFit: BoxFit.fill,
          autoplay: true,
          autoplayDuration: Duration(seconds: 6),
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(seconds: 4),
        ),
      ),
    );
  }

  void openNewPageForSelectedImage(int index, BuildContext context) {
    switch (index) {
      case 0:
        {
          Navigator.of(context).pushNamed(PromotionsAndEvents.routeName);
          break;
        }
      case 2:
        {
          Navigator.of(context).pushNamed(Membership.routeName);
          break;
        }
      case 3:
        {
          Navigator.of(context).pushNamed(PromotionBanner.routeName);
          break;
        }
      case 4:
        {
          Navigator.of(context).pushNamed(ReferAndEarn.routeName);
          break;
        }
    }
  }
}
