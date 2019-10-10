import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final String imageSRC;

  BackgroundImage(this.imageSRC);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageSRC,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
}
