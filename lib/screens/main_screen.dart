import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lectorem/models/access_token.dart';
import 'package:lectorem/utilities/helpers.dart';
import 'package:lectorem/widgets/custom_app_bar.dart';
import 'package:lectorem/widgets/custom_navigation_bar.dart';

import 'dart:io' show Platform;

import 'login_screen.dart';
import 'collection_list_screen.dart';
import 'subscription_list_screen.dart';

class MainScreen extends StatefulWidget {
  static const id = 'tab_bar_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<BottomNavigationBarItem> items = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.collections),
      title: Text('Collections'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.subscriptions),
      title: Text('Subscriptions'),
    ),
  ];
  List<Widget> _widgetOptions = <Widget>[
    CollectionListScreen(),
    SubscriptionListScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void checkIfLoggedIn(BuildContext context) async {
    AccessToken accessToken = await getAccessToken();
    if (accessToken == null) {
      Navigator.pushReplacement(
          context,
          Platform.isIOS
              ? CupertinoPageRoute(builder: (context) => LoginScreen())
              : MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    checkIfLoggedIn(context);
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTabScaffold(
            tabBar: CupertinoTabBar(items: items),
            tabBuilder: (BuildContext context, int index) {
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return CupertinoPageScaffold(
                    navigationBar: CustomNavigationBar(
                      title: 'Lectorem',
                      isLogoutEnabled: true,
                    ),
                    child: _widgetOptions.elementAt(index),
                  );
                },
              );
            },
          )
        : DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: CustomAppBar(
                title: 'Lectorem',
                isLogoutEnabled: true,
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {},
              ),
              body: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: items,
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
            ),
          );
  }
}
