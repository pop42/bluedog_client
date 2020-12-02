import 'package:bluedog_client/common/constants/breakpoints.dart';
import 'package:bluedog_client/common/widgets/app/app_navigation_drawer.dart';
import 'package:bluedog_client/common/widgets/app/app_navigation_pane.dart';
import 'package:bluedog_client/common/widgets/app/app_side_rail.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget appBar;
  final Widget body;

  AppScaffold({
    Key key,
    this.appBar,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (screenWidth >= Breakpoints.largeTabletPortrait) AppSideRail(),
          if (screenWidth >= Breakpoints.largeTabletLandscape)
            AppNavigationPane(),
          Expanded(
            child: Material(
              child: body,
            ),
          ),
        ],
      ),
      drawer: AppNavigationDrawer(),
    );
  }
}
