import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/widget_methods/Forms/dropdown.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splash";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TextEditingController _controller;
  String selectedCountry;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          mainPhotoWidget(),
          acuvueLogoContainer(),
          bottomMainContainer(),
        ],
      ),
    );
  }

  Widget mainPhotoWidget() {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          "images/splash_screen_main.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget acuvueLogoContainer() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Image.asset(
          "images/splash_logo.png",
          width: 250.0,
          height: 250.0,
        ),
      ),
    );
  }

  Widget bottomMainContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(2.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Please enter your phone number',
                        style: kRewardTerms,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10.0, left: 5.0),
                    child: Material(
                      child: DropDownMainWidget(countryList, (String value) {
                        setState(() {
                          selectedCountry = value;
                        });
                      }, selectedCountry),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      children: <Widget>[
                        selectedCountry == null
                            ? Container()
                            : selectedCountry == 'HKG'
                                ? numberRowContainer('+852')
                                : selectedCountry == 'TWN'
                                    ? numberRowContainer('+886')
                                    : Container(),
                        Expanded(
                          child: Container(
                            child: Material(
                              child: TextFormField(
                                maxLength: 10,
                                controller: _controller,
                                keyboardType: TextInputType.number,
                                decoration: new InputDecoration(
                                  counterText: '',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              color: darkBlueColor,
              child: FlatButton(
                child: Text(
                  'Send Verification OTP',
                  style: kReferBtn,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Recover my Account',
                style: kPrivacyPara,
                textAlign: TextAlign.end,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget numberRowContainer(String text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Text(
        text,
        style: kRewardTerms,
      ),
    );
  }
}
