import 'package:bluedog_client/common/widgets/app/app_navigation.dart';
import 'package:flutter/material.dart';

class AppNavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: AppNavigation(),
    );
  }
}
