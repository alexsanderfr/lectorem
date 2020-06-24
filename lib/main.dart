import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lectorem/screens/main_screen.dart';
import 'dart:io' show Platform;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
            title: 'Lectorem',
            theme: CupertinoThemeData(
              primaryColor: Colors.indigo,
              primaryContrastingColor: Colors.redAccent,
            ),
            home: MainScreen(),
          )
        : MaterialApp(
            title: 'Lectorem',
            theme: ThemeData(
              primarySwatch: Colors.indigo,
              accentColor: Colors.redAccent,
            ),
            home: MainScreen(),
          );
  }
}
