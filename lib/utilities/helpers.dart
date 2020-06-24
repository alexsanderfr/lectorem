import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:intl/intl.dart';
import 'package:lectorem/models/access_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<AccessToken> getAccessToken() async {
  final prefs = await SharedPreferences.getInstance();
  String accessToken = prefs.getString('access_token');
  if (accessToken != null) {
    Map accessTokenJson = jsonDecode(accessToken);
    return AccessToken.fromJson(accessTokenJson);
  } else {
    return null;
  }
}

Future<void> setAccessToken(AccessToken accessToken) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('access_token', jsonEncode(accessToken));
}

Future<void> clearAccessToken() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('access_token', null);
}

DateTime timestampToDate(int timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(timestamp);
}

String formatDate(int timestamp) {
  DateTime dateTime = timestampToDate(timestamp);
  DateFormat formatter = DateFormat.yMd('en_US').add_jms();
  return formatter.format(dateTime);
}

Future<bool> hasInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    return false;
  } else if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}
