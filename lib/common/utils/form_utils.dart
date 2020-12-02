import 'package:flutter/material.dart';

abstract class FormUtils {
  static void dismissKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (currentFocus != null && !currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static void fieldFocusChange({
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  }) {
    currentFocus?.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
