import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lectorem/utilities/colors.dart';
import 'package:lectorem/utilities/constants.dart';

class NoConnectionErrorWidget extends StatelessWidget {
  final Function onRetryCallback;

  const NoConnectionErrorWidget({this.onRetryCallback});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.sadCry,
          color: Colors.grey,
          size: 120.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Text(
            'An error has ocurred, maybe you should check your internet connection?',
            style: kErrorWidgetTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        RaisedButton(
          color: CustomColors.accentColor,
          child: Text(
            'Try again',
            style: kRaisedButtonTextStyle,
          ),
          onPressed: onRetryCallback,
        )
      ],
    );
  }
}
