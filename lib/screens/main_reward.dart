import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/AcuvueReward/acuvue_rewards.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/LifeStyleReward/life_style_reward.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/main_upper_container_for_reward_and_cart.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/reward_btn_widget.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/uper_container_reward.dart';

class MainReward extends StatefulWidget {
  @override
  _MainRewardState createState() => _MainRewardState();
}

enum ScreenSelected {
  Wallet,
  AcuvuewReward,
  LifestyleReward,
}

class _MainRewardState extends State<MainReward> {
  ScreenSelected screenType = ScreenSelected.Wallet;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          UpperContainer(),
          btnContainer(),
          screenType == ScreenSelected.Wallet
              ? createWalletContainer()
              : screenType == ScreenSelected.AcuvuewReward
                  ? AcuvueRewards()
                  : LifeStyleReward(),
        ],
      ),
    );
  }

  Widget createWalletContainer() {
    return Expanded(
      flex: 1,
      child: Center(
        child: Text(
          'No wallet coupon available',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      ),
    );
  }

  Widget createAcuvueRewardContainer() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.greenAccent,
      ),
    );
  }

  Widget createLifestyleRewardContainer() {
    return Expanded(
      child: Container(
        color: Colors.orange,
      ),
    );
  }

  Widget btnContainer() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          screenType == ScreenSelected.Wallet
              ? RewardBtnWidget('Wallet', darkBlueColor, () {
                  _selectedState(ScreenSelected.Wallet);
                })
              : RewardBtnWidget('Wallet', lightRegularColor, () {
                  _selectedState(ScreenSelected.Wallet);
                }),
          screenType == ScreenSelected.AcuvuewReward
              ? RewardBtnWidget('ACUVUE Rewards', darkBlueColor, () {
                  _selectedState(ScreenSelected.AcuvuewReward);
                })
              : RewardBtnWidget('ACUVUE Rewards', lightRegularColor, () {
                  _selectedState(ScreenSelected.AcuvuewReward);
                }),
          screenType == ScreenSelected.LifestyleReward
              ? RewardBtnWidget('Lifestyle Rewards', darkBlueColor, () {
                  _selectedState(ScreenSelected.LifestyleReward);
                })
              : RewardBtnWidget('Lifestyle Rewards', lightRegularColor, () {
                  _selectedState(ScreenSelected.LifestyleReward);
                }),
        ],
      ),
    );
  }

  void _selectedState(ScreenSelected selectedState) {
    setState(() {
      screenType = selectedState;
    });
  }
}
