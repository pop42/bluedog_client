import 'package:bluedog_client/common/theme/styles.dart';
import 'package:bluedog_client/common/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

ThemeData buildTheme(BuildContext context) {
  final primaryColor = ThemeColors.primaryColor;
  final accentColor = ThemeColors.accentColor;

  return ThemeData(
    // primarySwatch: ThemeColors.primarySwatch,

    backgroundColor: Colors.white,
    primaryColor: primaryColor,
    accentColor: accentColor,
    errorColor: Colors.red.shade800,

    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: Styles.primaryFontSize,
      ),
    ),

    // buttonTheme: ButtonThemeData(
    //   buttonColor: accentColor,
    //   textTheme: ButtonTextTheme.primary,
    //
    //   // Controls link color
    //   colorScheme: Theme.of(context).colorScheme.copyWith(
    //         primary: ThemeColors.linkColor,
    //       ),
    // ),
    //
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor: accentColor,
    //   foregroundColor: Colors.white,
    // ),
    //
    // // Controls text fields
    // inputDecorationTheme: InputDecorationTheme(
    //   focusedBorder: UnderlineInputBorder(
    //     borderSide: BorderSide(
    //       color: primaryColor,
    //       width: 2.0,
    //     ),
    //   ),
    // ),
    //
    // navigationRailTheme: NavigationRailThemeData(
    //   backgroundColor: ThemeColors.background,
    //   unselectedIconTheme: IconThemeData(
    //     color: ThemeColors.active,
    //   ),
    //   selectedIconTheme: IconThemeData(
    //     color: accentColor,
    //     opacity: 1.0,
    //   ),
    //   unselectedLabelTextStyle: TextStyle(
    //     fontWeight: FontWeight.w400,
    //   ),
    //   selectedLabelTextStyle: TextStyle(
    //     fontWeight: FontWeight.w400,
    //     color: accentColor,
    //   ),
    // ),
    //
    // textSelectionTheme: TextSelectionThemeData(cursorColor: primaryColor),
    //
    // // Controls switches and checkboxes
    // toggleableActiveColor: accentColor,
    //
    // // Controls text color on accent-colored buttons
    // accentColorBrightness: Brightness.dark,

    appBarTheme: AppBarTheme(
      elevation: 0.5,
      brightness: Brightness.light,
      color: ThemeColors.background,
      iconTheme: IconThemeData(
        color: ThemeColors.active,
      ),
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: Styles.titleFontSize,
          // fontWeight: FontWeight.w500,
          color: ThemeColors.primaryText,
        ),
      ),
    ),

    // tabBarTheme: TabBarTheme(
    //   labelColor: primaryColor,
    // ),
  );
}
