import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:io' show Platform;

class OpenContainerWrapper extends StatelessWidget {
  final Widget targetScreen;
  final Widget child;

  const OpenContainerWrapper({this.targetScreen, this.child});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute(builder: (context) => targetScreen),
              );
            },
            child: Material(child: child),
          )
        : OpenContainer(
            transitionType: ContainerTransitionType.fadeThrough,
            openBuilder: (BuildContext context, VoidCallback _) {
              return targetScreen;
            },
            closedBuilder: (BuildContext _, VoidCallback openContainer) {
              return InkWell(onTap: openContainer, child: child);
            });
  }
}
