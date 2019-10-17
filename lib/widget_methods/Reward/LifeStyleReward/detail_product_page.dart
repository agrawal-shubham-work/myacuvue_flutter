import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/lifestyle_reward_model.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/utilities/global_variable.dart';

class ProductDetails extends StatefulWidget {
  final LifestyleRewardModel modelList;

  ProductDetails(this.modelList);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.modelList.productName),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150.0,
                  width: 150.0,
                  margin: EdgeInsets.symmetric(vertical: 30.0),
                  child: Image.asset(
                    widget.modelList.productImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "${widget.modelList.productPoints} Points",
                  style: kRewardTerms,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                  color: Color(0xFf013F7C),
                  child: FlatButton(
                    onPressed: () {
                      if (GlobalVariable.lifeStyleRewardList.length == 0) {
                        GlobalVariable.lifeStyleRewardList
                            .add(widget.modelList);
                      } else {
                        for (int index = 0;
                            index < GlobalVariable.lifeStyleRewardList.length;
                            index++) {
                          if (GlobalVariable
                              .lifeStyleRewardList[index].productName
                              .toLowerCase()
                              .contains(
                                  widget.modelList.productName.toLowerCase())) {
                            break;
                          } else {
                            GlobalVariable.lifeStyleRewardList
                                .add(widget.modelList);
                          }
                        }
                      }
                    },
                    child: Text(
                      'Add to cart',
                      style: kRewardBtn,
                    ),
                  ),
                ),
                Text(
                  'Validity : Oct 17, 2019',
                  style: kStoreName,
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            _productDetailHeading('Terms and Condition', kTermsHeading),
            _productDetailSubHeading(mTermsSubHeading1, kTermsSubHeading),
            _productDetailSubHeading(mTermsSubHeading2, kTermsSubHeading),
            _productDetailSubHeading(mTermsSubHeading3, kTermsSubHeading),
          ],
        ),
      ),
    );
  }

  Widget _productDetailHeading(String termsText, TextStyle termsStyle) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        termsText,
        style: termsStyle,
      ),
    );
  }

  Widget _productDetailSubHeading(String termsText, TextStyle termsStyle) {
    return Container(
      margin: EdgeInsets.all(2.0),
      child: Text(
        termsText,
        style: termsStyle,
      ),
    );
  }
}