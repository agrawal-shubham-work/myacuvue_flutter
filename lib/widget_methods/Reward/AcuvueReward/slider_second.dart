import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class SliderSecond extends StatelessWidget {
  final String imagePath;

  SliderSecond(this.imagePath);

  Widget createTextForTerms(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: kRewardTerms,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Stack(
              children: <Widget>[
                Center(child: CircularProgressIndicator()),
                Center(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Terms And Condition',
                      style: kRewardTerms,
                    ),
                  ),
                  createTextForTerms(
                      '.This reward is not exchangeable for cash.'),
                  createTextForTerms(
                      '.This reward is valid with a minimum purchase of 2 boxes of any ACUVUE contact lenses.'),
                  createTextForTerms(
                      '.Any unutilised value of this reward is not refundable.'),
                  createTextForTerms(
                      '.This reward is valid for 2 months from the date of redemption.'),
                  createTextForTerms(
                      '.This reward cannot be used together with any other ACUVUE related vouchers'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
