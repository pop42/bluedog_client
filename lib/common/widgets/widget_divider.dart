import 'package:bluedog_client/common/theme/styles.dart';
import 'package:flutter/material.dart';

class WidgetDivider extends StatelessWidget {
  const WidgetDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: Styles.dividerHeight,
      thickness: Styles.dividerThickness,
    );
  }
}
