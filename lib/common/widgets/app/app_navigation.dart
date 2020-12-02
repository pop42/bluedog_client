import 'package:bluedog_client/common/theme/styles.dart';
import 'package:flutter/material.dart';

class AppNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListTile(
            title: Text(
              'Vehicles',
              style: Styles.primaryText(context),
            ), // TODO: I10N
            onTap: () {
              // TODO: Implement
            },
          ),
        ],
      ),
    );
  }
}
