import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';

class RewardBtnWidget extends StatelessWidget {
  final String btnText;
  final Function onTaped;

  RewardBtnWidget(this.btnText, this.onTaped);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4.0),
        color: Color(0xFF013F7C),
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
