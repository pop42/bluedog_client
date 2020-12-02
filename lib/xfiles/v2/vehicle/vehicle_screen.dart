import 'package:bluedog_client/common/models/vehicle.dart';
import 'package:bluedog_client/xfiles/v2/vehicle/vehicle_form.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class VehicleScreen extends StatelessWidget {
  final Vehicle vehicle;

  VehicleScreen({
    Key key,
    @required this.vehicle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vehicle.name),
      ),
      body: VehicleForm(
        vehicle: vehicle,
      ),
    );
  }
}
