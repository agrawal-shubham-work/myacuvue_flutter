import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';

class upperContainerWidget extends StatelessWidget {
  final String heading, data;

  upperContainerWidget(this.heading, this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            '$heading',
            style: kReferPara,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Text(
              '$data',
              style: kReferPara,
            ),
          )
        ],
      ),
    );
  }
}
