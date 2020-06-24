import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectorem/utilities/colors.dart';

final kRaisedButtonTextStyle = GoogleFonts.sourceSansPro(color: Colors.white);
final kOutlineButtonTextStyle =
    GoogleFonts.sourceSansPro(color: CustomColors.accentColor);
final kPrimaryTextStyle = GoogleFonts.montserrat(color: Colors.black);
final kSecondaryTextStyle = GoogleFonts.montserrat(color: Colors.grey);
final kAppTitleTextStyle = GoogleFonts.montserrat(
  color: Colors.black,
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);
final kTitleTextStyle =
    GoogleFonts.montserrat(color: Colors.black, fontSize: 16.0);
final kTitleReadTextStyle =
    kTitleTextStyle.copyWith(color: CustomColors.darkGrey);
final kSubtitleTextStyle = GoogleFonts.montserrat(
  color: Colors.grey,
  fontSize: 14.0,
);
final kSubtitleReadTextStyle =
    kSubtitleTextStyle.copyWith(color: CustomColors.mediumGrey);

final kAppBarTextStyle = GoogleFonts.montserrat(
  color: CustomColors.primaryColor,
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);
final kAppBarButtonTextStyle = GoogleFonts.montserrat(color: Colors.black);
final kCupertinoAppBarButtonTextStyle = GoogleFonts.montserrat();
final kErrorWidgetTextStyle =
    GoogleFonts.montserrat(color: Colors.grey, fontSize: 18.0);
final kMarkReadButtonTextStyle = GoogleFonts.montserrat(
  color: Colors.grey,
  fontSize: 12.0,
);
