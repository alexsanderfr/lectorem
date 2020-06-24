import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lectorem/models/access_token.dart';
import 'package:lectorem/services/api.dart';
import 'package:lectorem/utilities/colors.dart';
import 'package:lectorem/utilities/helpers.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'dart:io' show Platform;

import 'main_screen.dart';

class WebViewScreen extends StatefulWidget {
  static const String id = 'web_view_screen';

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  bool isLoading = false;

  void fetchAccessToken(String code, FeedlyApi api) async {
    AccessToken accessToken = await api.getAccessToken(code);
    await setAccessToken(accessToken);
    Navigator.pushAndRemoveUntil(
      context,
      Platform.isIOS
          ? CupertinoPageRoute(builder: (context) => MainScreen())
          : MaterialPageRoute(builder: (context) => MainScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    FeedlyApi api = FeedlyApi();
    return isLoading
        ? Scaffold(
            body: Center(
              child: SpinKitRing(
                color: CustomColors.accentColor,
              ),
            ),
          )
        : WebView(
            initialUrl: api.buildUrlForAuth(),
            navigationDelegate: (request) {
              Uri uri = Uri.parse(request.url);
              String code = uri.queryParameters['code'];
              if (code != null && code != '') {
                setState(() {
                  isLoading = true;
                });
                fetchAccessToken(code, api);
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          );
  }
}
