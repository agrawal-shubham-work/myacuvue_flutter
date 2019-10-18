import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';

class RewardBtnWidget extends StatelessWidget {
  final String btnText;
  final Color color;
  final Function onTaped;

  RewardBtnWidget(this.btnText, this.color, this.onTaped);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4.0),
        color: color,
        child: FlatButton(
          onPressed: onTaped,
          child: Text(
            btnText,
            style: kRewardBtn,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
