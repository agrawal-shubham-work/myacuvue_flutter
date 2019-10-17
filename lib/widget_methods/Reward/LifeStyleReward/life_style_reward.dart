import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_acuvue_flutter/lifestyle_reward_model.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/LifeStyleReward/detail_product_page.dart';

class LifeStyleReward extends StatefulWidget {
  static const String routeName = '/lifestylereward';
  @override
  _LifeStyleRewardState createState() => _LifeStyleRewardState();
}

class _LifeStyleRewardState extends State<LifeStyleReward> {
  List<LifestyleRewardModel> lisfestyleRewardList = [];

  Future<String> _loadProductData() async {
    return await rootBundle.loadString('assets/product.json');
  }

  Future<List<LifestyleRewardModel>> _productDetails() async {
    String jsonString = await _loadProductData();
    final jsonResponse = json.decode(jsonString);
    var item = List<LifestyleRewardModel>();

    for (var productData in jsonResponse['Product']) {
      LifestyleRewardModel data = LifestyleRewardModel(productData['image'],
          productData['name'], productData['points'], productData['desc']);

      item.add(data);
    }

    return item;
  }

  @override
  void initState() {
    _productDetails().then((values) {
      setState(() {
        lisfestyleRewardList.addAll(values);
      });
    });
    print(lisfestyleRewardList.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: lisfestyleRewardList.length,
          itemBuilder: (BuildContext context, int index) {
            return lisfestyleRewardList.length != 0
                ? _buildListItems(
                    index,
                  )
                : Container();
          },
        ),
      ),
    );
  }

  Widget _buildListItems(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetails(lisfestyleRewardList[index])));
      },
      child: Container(
        height: 150.0,
        margin: EdgeInsets.all(5.0),
        child: Card(
          color: Colors.blue.shade100,
          elevation: 14.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Image.asset(
                        lisfestyleRewardList[index].productImage,
                        fit: BoxFit.fill,
                      ))),
              Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(lisfestyleRewardList[index].productName),
                    Text(lisfestyleRewardList[index].productPoints),
                    Text(lisfestyleRewardList[index].productDesc),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
