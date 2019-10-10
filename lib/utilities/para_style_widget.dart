import 'package:flutter/material.dart';

class PrivacyParaWidget extends StatelessWidget {
  final String paraText;
  final TextStyle style;

  PrivacyParaWidget(this.paraText, this.style);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(paraText, style: style),
    );
  }
}
