import 'package:bluedog_client/common/constants/breakpoints.dart';
import 'package:bluedog_client/common/theme/styles.dart';
import 'package:bluedog_client/common/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class AppSideRail extends StatelessWidget {
  Widget buildMenuIconButton(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final displayButton = screenWidth < Breakpoints.largeTabletLandscape;

    return displayButton
        ? IconButton(
            icon: Icon(
              Icons.menu,
              color: ThemeColors.active,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          )
        : SizedBox(
            width: 48.0,
          );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Convert to NavigationRail?
    return Container(
      padding: EdgeInsets.only(
        bottom: Styles.spacerSizeDoubled,
      ),
      constraints: BoxConstraints(
        minWidth: 48.0,
        maxWidth: 56.0,
      ),
      decoration: BoxDecoration(
        // color: ThemeColors.primaryColor, // TODO: Testing
        border: Border(
          right: BorderSide(
            color: ThemeColors.sectionDividerColor,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildMenuIconButton(context),
          RotatedBox(
            quarterTurns: -1,
            child: Text(
              'RTA', // TODO: I10N
              style: TextStyle(
                fontSize: Styles.titleFontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
