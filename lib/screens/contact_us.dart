import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/widget_methods/About/privacy_policy.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  static const String routeName = '/contactus';

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(('Contact us')),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          firstCard(),
          secondCard(),
        ],
      ),
    );
  }

  Widget firstCard() {
    return Card(
      margin: EdgeInsets.all(5.0),
      elevation: 8.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: Text(
              "For Product-Related enquires",
              style: kContactHeadingTextStyle,
              textAlign: TextAlign.start,
            ),
          ),
          Row(
            children: <Widget>[
              textCard(
                "Call :",
                () {},
                kContactUsTextStyle,
              ),
              textCard(
                "800-101-3130",
                () {
                  _launchCaller("800-101-3130");
                },
                kContactUsLinkTextStyle,
              ),
            ],
          ),
          textCard(
            "Monday - Friday 8:00am - 4:00pm",
            () {},
            kContactUsTextStyle,
          ),
          textCard(
            "OR",
            () {},
            kContactUsTextStyle,
          ),
          Row(
            children: <Widget>[
              textCard(
                "Email :",
                () {},
                kContactUsTextStyle,
              ),
              textCard(
                "support@acuvue.com.sg",
                () {
                  _launchEmail();
                },
                kContactUsLinkTextStyle,
              ),
            ],
          ),
          /*textCard(
            "By Submitting your information, you agree that it will be governed by Johnson and Johnson Vision Privacy Policy.",
            () {},
            kContactUsTextStyle,
          ),*/
          Container(
            padding: EdgeInsets.only(left: 5.0, top: 10.0),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text:
                          "By Submitting your information, you agree that it will be governed by Johnson and Johnson Vision ",
                      style: kContactUsTextStyle),
                  TextSpan(
                    text: "Privacy Policy.",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context)
                            .pushNamed(PrivacyPolicy.routeName);
                      },
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontFamily: 'GRABLIGHT'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }

  Widget secondCard() {
    return Card(
      margin: EdgeInsets.all(5.0),
      elevation: 8.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: Text(
              "For MyACUVUE enquires",
              style: kContactHeadingTextStyle,
              textAlign: TextAlign.start,
            ),
          ),
          Row(
            children: <Widget>[
              textCard(
                "Call :",
                () {},
                kContactUsTextStyle,
              ),
              textCard(
                "6747-1131",
                () {
                  _launchCaller("6747-1131");
                },
                kContactUsLinkTextStyle,
              ),
            ],
          ),
          textCard(
            "Monday - Friday 9:00am - 6:00pm",
            () {},
            kContactUsTextStyle,
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  _launchCaller(String telNo) async {
    String url = "tel:$telNo";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchEmail() async {
    String url = "mailto:support@acuvue.com.sg?subject=product-related enquiry";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget textCard(String text, Function onTap, TextStyle textStyle) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Text(
          text,
          style: textStyle,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
