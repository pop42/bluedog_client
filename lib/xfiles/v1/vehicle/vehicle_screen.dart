import 'package:bluedog_client/common/models/vehicle.dart';
import 'package:bluedog_client/common/widgets/app/app_scaffold.dart';
import 'package:bluedog_client/xfiles/v1/vehicle/vehicle_form.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class VehicleScreen extends StatelessWidget {
  final Vehicle vehicle;
  final bool isMasterDetailLayout;

  VehicleScreen({
    @required this.vehicle,
    @required this.isMasterDetailLayout,
  }) : assert(isMasterDetailLayout != null);

  @override
  Widget build(BuildContext context) {
    if (isMasterDetailLayout) {
      return VehicleForm(
        vehicle: vehicle,
      );
    }

    return AppScaffold(
      appBar: AppBar(
        title: Text(vehicle.name),
      ),
      body: VehicleForm(
        vehicle: vehicle,
      ),
    );
  }
}
