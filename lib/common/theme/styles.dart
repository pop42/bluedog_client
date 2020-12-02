import 'package:bluedog_client/common/theme/theme_colors.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static const spacerSize = 8.0;

  static const spacerSizeDoubled = spacerSize * 2;

  static const dividerHeight = 1.0;
  static const dividerThickness = 0.45;

  static const borderRadius = 4.0;

  static const smallerIconSize = 20.0;

  static const largerIconSize = 28.0;

  static const h1FontSize = 28.0;

  static const h2FontSize = 22.0;

  static const h3FontSize = 18.0;

  static const titleFontSize = 20.0;

  static const primaryFontSize = 16.0;

  static const secondaryFontSize = 14.0;

  static const captionFontSize = 12.0;

  static TextStyle primaryText(
    BuildContext context, {
    Color color,
    bool bold = false,
    bool disabled = false,
  }) =>
      TextStyle(
        fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
        color: disabled
            ? ThemeColors.disabledText
            : (color ?? ThemeColors.primaryText),
        fontWeight: bold ? FontWeight.w500 : FontWeight.w400,
      );

  static TextStyle secondaryText(
    BuildContext context, {
    Color color,
    bool bold = false,
    bool disabled = false,
  }) =>
      TextStyle(
        fontSize: Theme.of(context).textTheme.bodyText2.fontSize,
        color: disabled
            ? ThemeColors.disabledText
            : (color ?? ThemeColors.secondaryText),
        fontWeight: bold ? FontWeight.w500 : FontWeight.w400,
        height: 1.2,
      );

  static TextStyle captionText(
    BuildContext context, {
    Color color,
    bool bold = false,
    bool disabled = false,
  }) =>
      TextStyle(
        fontSize: Theme.of(context).textTheme.caption.fontSize,
        fontWeight: bold ? FontWeight.w500 : FontWeight.w400,
        color: disabled
            ? ThemeColors.disabledText
            : (color ?? ThemeColors.secondaryText),
      );

  static const widgetPadding = EdgeInsets.only(
    top: spacerSize,
  );

  static const widgetPaddingDoubled = EdgeInsets.only(
    top: spacerSizeDoubled,
  );

  static const formFieldPadding = EdgeInsets.only(
    bottom: spacerSize,
  );

  static const formFieldSuffixPadding = EdgeInsets.only(
    left: spacerSize,
  );

  static const cardElevation = 2.0;

  static const cardTitleText = TextStyle(
    fontSize: h3FontSize,
    fontWeight: FontWeight.w500,
  );

  static const largeButtonText = TextStyle(
    fontSize: h3FontSize,
    fontWeight: FontWeight.w500,
  );

  static const fontAwesomeIconSize = 20.0;

  static const fontAwesomeIconButtonLabelPadding = EdgeInsets.only(
    right: spacerSize,
  );
}
