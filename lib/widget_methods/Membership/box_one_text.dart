import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';

class CreateBoxWithOneText extends StatelessWidget {
  final String imagePath, title;

  CreateBoxWithOneText(this.imagePath, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Image.asset(imagePath),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              title,
              style: kVipHeading,
            ),
          ),
        ],
      ),
    );
  }
}
