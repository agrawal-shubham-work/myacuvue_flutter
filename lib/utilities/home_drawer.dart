import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/routes/static_routes.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Stack(
          children: <Widget>[
            ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                _createDrawerItem(
                    icon: Icons.tag_faces,
                    text: 'My Profile',
                    onTap: () => Navigator.pushReplacementNamed(
                        context, StaticRoutes.splash)),
                _createDrawerItem(
                    icon: Icons.remove_red_eye,
                    text: 'Eye Care Center',
                    onTap: () => Navigator.pushReplacementNamed(
                        context, StaticRoutes.home)),
                _createDrawerItem(
                  icon: Icons.note,
                  text: 'Notes',
                ),
                _createDrawerItem(
                    icon: Icons.thumbs_up_down, text: 'Promotions and Events'),
                _createDrawerItem(icon: Icons.add, text: 'Refer and Earn'),
                _createDrawerItem(
                    icon: Icons.card_membership, text: 'Membership'),
                _createDrawerItem(
                    icon: Icons.account_box, text: 'About MuAcuvue™'),
                _createDrawerItem(icon: Icons.settings, text: 'Settings'),
                _createDrawerItem(
                    icon: Icons.notifications_active, text: 'Notifications'),
                _createDrawerItem(
                    icon: Icons.contact_phone, text: 'Contact us'),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 15.0),
                title: Text('App Version No -P v3.3.1'),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Color(0xFF013F7C),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: kDrawerTextStyle,
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
