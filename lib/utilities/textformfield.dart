import 'package:flutter/material.dart';

class TextFieldMainWidget extends StatelessWidget {
  final String hintText;
  final TextInputType type;
  final Function tapFunc;
  final TextEditingController controller;
  TextFieldMainWidget(@required this.hintText, @required this.type,
      @required this.tapFunc, @required this.controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: new InputDecoration(
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
