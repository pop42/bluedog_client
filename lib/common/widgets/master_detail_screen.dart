import 'package:bluedog_client/common/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class MasterDetailScreen extends StatelessWidget {
  final Widget master;
  final Widget detail;

  const MasterDetailScreen({
    Key key,
    @required this.master,
    @required this.detail,
  })  : assert(master != null),
        assert(detail != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 300.0,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: ThemeColors.sectionDividerColor,
              ),
            ),
          ),
          child: master,
        ),
        Expanded(
          child: detail,
        ),
      ],
    );
  }
}
