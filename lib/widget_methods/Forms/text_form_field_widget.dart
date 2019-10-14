import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String heading;
  final bool isMandatory;
  final Widget childFunct;

  TextFormFieldWidget(
      @required this.heading, @required this.isMandatory, this.childFunct);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 2.0),
                  child: Text(
                    '$heading',
                    style: kFormHeadingStyle,
                  )),
              isMandatory
                  ? Text(
                      '*',
                      style: kMandatorySign,
                    )
                  : SizedBox(
                      width: 0.0,
                    ),
            ],
          ),
          childFunct
        ],
      ),
    );
  }
}
