import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lectorem/screens/login_screen.dart';
import 'package:lectorem/utilities/constants.dart';
import 'package:lectorem/utilities/helpers.dart';

class CustomNavigationBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  final String title;
  final bool isLogoutEnabled;

  CustomNavigationBar({this.title = 'Lectorem', this.isLogoutEnabled = false})
      : preferredSize = Size.fromHeight(44.0);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      middle: Text(title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: kAppBarTextStyle),
      trailing: isLogoutEnabled
          ? CupertinoButton(
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                clearAccessToken();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text(
                'Log out',
                style: kCupertinoAppBarButtonTextStyle,
              ),
            )
          : null,
    );
  }

  @override
  final Size preferredSize; // default

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}
