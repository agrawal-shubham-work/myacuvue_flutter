import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/widget_methods/About/terms_of_use.dart';

class AboutMyAcuvue extends StatefulWidget {
  static const String routeName = '/aboutmyacuvue';
  @override
  _AboutMyAcuvueState createState() => _AboutMyAcuvueState();
}

class _AboutMyAcuvueState extends State<AboutMyAcuvue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About My Acuvue'),
        ),
        body: Stack(
          children: <Widget>[
            buildUpperContainer(),
            buildBottomContainer(),
          ],
        ));
  }

  Widget buildUpperContainer() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CreateAboutBtn('About MyACUVUE™', () {}),
            CreateAboutBtn('Terms of Use', () {
              Navigator.of(context).pushNamed(TermsOfUse.routeName);
            }),
            CreateAboutBtn('Privacy Policy', () {}),
            CreateAboutBtn('Contact us', () {}),
          ],
        ),
      ),
    );
  }

  Widget buildBottomContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AboutTextWidget('© Johnson &amp; Johnson Pte. Ltd 2016'),
          AboutTextWidget(
              'This application is published by Johnson &amp; Johnson Pte. Ltd, which is solely responsible for its content. This application is intended for use by residents of Singapore'),
        ],
      ),
    );
  }

  Widget AboutTextWidget(String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        text,
        style: kAboutText,
      ),
    );
  }
}

class CreateAboutBtn extends StatelessWidget {
  final String btnText;
  final Function onTaped;
  CreateAboutBtn(this.btnText, this.onTaped);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      color: Color(0xFF013F7C),
      child: FlatButton(
        onPressed: onTaped,
        child: Text(
          btnText,
          style: kRewardBtn,
        ),
      ),
    );
  }
}
