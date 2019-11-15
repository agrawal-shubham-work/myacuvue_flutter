import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/models/lifestyle_reward_model.dart';
import 'package:my_acuvue_flutter/screens/store_cart.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/utilities/get_current_user_id.dart';
import 'package:my_acuvue_flutter/utilities/global_variable.dart';

class ProductDetails extends StatefulWidget {
  final LifestyleRewardModel modelList;

  ProductDetails(this.modelList);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int count = 0;

  DatabaseReference cartRef =
      FirebaseDatabase.instance.reference().child("cart");
  DatabaseReference countRef =
      FirebaseDatabase.instance.reference().child("cart");

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
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
                  child: Image.network(
                    widget.modelList.imageUrl,
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
                    onPressed: () async {
                      String userId = await inputData();
                      print(GlobalVariable.lifeStyleRewardList);
                      if (GlobalVariable.lifeStyleRewardList.length == 0) {
                        GlobalVariable.lifeStyleRewardList
                            .add(widget.modelList);
                        addDataToDatabase(
                            userId,
                            widget.modelList.imageUrl,
                            widget.modelList.productName,
                            widget.modelList.productPoints,
                            widget.modelList.productDesc,
                            widget.modelList.productQuantity);
                      } else {
                        if (GlobalVariable.lifeStyleRewardList
                            .contains(widget.modelList)) {
                          final snackbar = SnackBar(
                            content: Text('Product already in Cart'),
                            action: SnackBarAction(
                              label: 'Go to Cart',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Cart(userId)));
                              },
                            ),
                          );
                          _scaffoldkey.currentState.showSnackBar(snackbar);
                        } else {
                          GlobalVariable.lifeStyleRewardList
                              .add(widget.modelList);
                          addDataToDatabase(
                              userId,
                              widget.modelList.imageUrl,
                              widget.modelList.productName,
                              widget.modelList.productPoints,
                              widget.modelList.productDesc,
                              widget.modelList.productQuantity);
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

  addDataToDatabase(String userId, String imageUrl, String productName,
      String productPoints, String productDesc, String productQuantity) {
    int count;
    cartRef.child(userId).push().set(<String, dynamic>{
      "imageUrl": imageUrl,
      "productName": productName,
      "productPoints": productPoints,
      "productDesc": productDesc,
      "productQuantity": productQuantity,
    }).whenComplete(() async {
      final snapshot = await Firestore.instance
          .collection("cart")
          .document(userId)
          .collection("totalcount")
          .document("cartcount")
          .get();

      if (snapshot.exists) {
        await Firestore.instance.collection('cart').document(userId)
          ..collection("totalcount")
              .document("cartcount")
              .get()
              .then((DocumentSnapshot) =>
                  count = DocumentSnapshot.data['count'].toInt())
              .whenComplete(() async {
            count++;
            await Firestore.instance.collection('cart').document(userId)
              ..collection("totalcount")
                  .document("cartcount")
                  .setData(<String, int>{
                "count": count,
              }).whenComplete(() {
                print("Ok ADDED MORE");
              });
          });
      } else {
        await Firestore.instance.collection('cart').document(userId)
          ..collection("totalcount")
              .document("cartcount")
              .setData(<String, int>{
            "count": 1,
          }).whenComplete(() {
            print("Ok ADDED");
          });
      }

      final snackbar = SnackBar(
        content: Text('Product Added to Cart'),
        action: SnackBarAction(
          label: 'Go to Cart',
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart(userId)));
          },
        ),
      );
      _scaffoldkey.currentState.showSnackBar(snackbar);
    });
  }
}
