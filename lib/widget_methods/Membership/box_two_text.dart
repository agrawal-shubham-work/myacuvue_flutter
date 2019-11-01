import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';

class CreateBoxWithTwoText extends StatelessWidget {
  final String imagepath, title, subTitle;

  CreateBoxWithTwoText(this.imagepath, this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Image.asset(
            imagepath,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              title,
              style: kVipHeading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              subTitle,
              style: kVipText,
            ),
          ),
        ],
      ),
    );
  }
}
