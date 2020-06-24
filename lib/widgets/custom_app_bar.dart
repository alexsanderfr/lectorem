import 'package:flutter/material.dart';
import 'package:lectorem/screens/login_screen.dart';
import 'package:lectorem/utilities/colors.dart';
import 'package:lectorem/utilities/constants.dart';
import 'package:lectorem/utilities/helpers.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isLogoutEnabled;

  CustomAppBar({this.title, this.isLogoutEnabled})
      : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      textTheme: TextTheme().copyWith(headline3: kAppBarTextStyle),
      iconTheme:
          IconThemeData.fallback().copyWith(color: CustomColors.primaryColor),
      actionsIconTheme: IconThemeData.fallback().copyWith(color: Colors.black),
      title: Text(title, style: kAppBarTextStyle),
      actions: isLogoutEnabled
          ? <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    clearAccessToken();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  icon: Icon(Icons.exit_to_app),
                  label: Text(
                    'Log out',
                    style: kAppBarButtonTextStyle,
                  ))
            ]
          : [],
    );
  }
}
