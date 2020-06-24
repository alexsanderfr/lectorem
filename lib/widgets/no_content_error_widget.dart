import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lectorem/utilities/colors.dart';
import 'package:lectorem/utilities/constants.dart';

class NoContentErrorWidget extends StatelessWidget {
  final onRetryCallback;

  const NoContentErrorWidget({this.onRetryCallback});

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
            'There\'s nothing here to see',
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
