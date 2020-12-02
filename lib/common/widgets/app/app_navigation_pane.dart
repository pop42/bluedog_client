import 'package:bluedog_client/common/theme/theme_colors.dart';
import 'package:bluedog_client/common/widgets/app/app_navigation.dart';
import 'package:flutter/material.dart';

class AppNavigationPane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 150,
        maxWidth: 200,
      ),
      decoration: BoxDecoration(
        // color: Colors.grey.shade100, // TODO: Testing
        border: Border(
          right: BorderSide(
            color: ThemeColors.sectionDividerColor,
          ),
        ),
      ),
      child: AppNavigation(),
    );
  }
}
