import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lectorem/widgets/custom_app_bar.dart';
import 'package:lectorem/widgets/custom_navigation_bar.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final bool isLogoutEnabled;
  final Widget body;
  final FloatingActionButton floatingActionButton;
  final BottomNavigationBar bottomNavigationBar;

  const CustomScaffold(
      {this.title = 'Lectorem',
      this.body,
      this.isLogoutEnabled = false,
      this.floatingActionButton,
      this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CustomNavigationBar(
              title: title,
              isLogoutEnabled: isLogoutEnabled,
            ),
            child: body,
          )
        : Scaffold(
            appBar: CustomAppBar(
              title: title,
              isLogoutEnabled: isLogoutEnabled,
            ),
            body: body,
            floatingActionButton: floatingActionButton,
            bottomNavigationBar: bottomNavigationBar,
          );
  }
}
