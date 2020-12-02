import 'package:bluedog_client/common/models/vehicle.dart';
import 'package:flutter/material.dart';

class VehicleForm extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleForm({
    Key key,
    @required this.vehicle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      vehicle?.name ?? 'No vehicle selected', // TODO: I10N
    );
  }
}
