import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldMainWidget extends StatelessWidget {
  final String hintText;
  final TextInputType type;
  final Function tapFunc;
  final TextEditingController controller;
  final int maxCount;

  TextFieldMainWidget(
      this.hintText, this.type, this.tapFunc, this.controller, this.maxCount);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: TextFormField(
        maxLength: maxCount,
        controller: controller,
        keyboardType: type,
        decoration: new InputDecoration(
          counterText: '',
          hintText: '$hintText',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: tapFunc,
      ),
    );
  }
}
