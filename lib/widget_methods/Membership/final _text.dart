import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';

class final_text_member extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
      child: Text(
        mVipFinalText,
        style: kVipFinalText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
