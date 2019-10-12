import 'package:flutter/material.dart';

class CheckBoxMainWidgetState extends StatelessWidget {
  final bool privayCheck;
  final String privacyText;
  final Function changeState;

  CheckBoxMainWidgetState(@required this.privayCheck,
      @required this.privacyText, @required this.changeState);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: privayCheck,
          onChanged: changeState,
        ),
        Expanded(
          child: Text('$privacyText'),
        )
      ],
    );
  }
}
