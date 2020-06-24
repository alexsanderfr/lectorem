import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lectorem/screens/webview_screen.dart';
import 'package:lectorem/utilities/colors.dart';
import 'package:lectorem/utilities/constants.dart';
import 'package:lectorem/widgets/custom_scaffold.dart';
import 'dart:io' show Platform;

class LoginScreen extends StatelessWidget {
  static const id = 'login_screen';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: 196.0,
                    height: 196.0,
                    child: Image.asset('assets/app_icon_squircle.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ColorizeAnimatedTextKit(
                      textStyle: kAppTitleTextStyle,
                      colors: [
                        CustomColors.primaryColor,
                        CustomColors.accentColor,
                        Colors.black,
                      ],
                      textAlign: TextAlign.start,
                      alignment: AlignmentDirectional.topStart,
                      pause: Duration(seconds: 1),
                      isRepeatingAnimation: true,
                      text: ['Lectorem for Feedly'],
                    ),
                  ),
                  OpenContainer(
                    closedColor: CustomColors.accentColor,
                    transitionType: ContainerTransitionType.fadeThrough,
                    openBuilder: (BuildContext context, VoidCallback _) {
                      return WebViewScreen();
                    },
                    tappable: false,
                    closedBuilder:
                        (BuildContext _, VoidCallback openContainer) {
                      return Platform.isIOS
                          ? CupertinoButton(
                        onPressed: openContainer,
                        child: Text(
                          'Login with Feedly'.toUpperCase(),
                          style: kRaisedButtonTextStyle,
                        ),
                      )
                          : InkWell(
                        onTap: openContainer,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Login with Feedly'.toUpperCase(),
                            style: kRaisedButtonTextStyle,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Text(
              'Lectorem is developed by Laserbot Labs',
              style: kSubtitleTextStyle,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                'Feedly is developed by feedly, Inc',
                style: kSubtitleTextStyle,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
