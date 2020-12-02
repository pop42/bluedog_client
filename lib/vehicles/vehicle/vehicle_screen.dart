import 'package:bluedog_client/common/models/vehicle.dart';
import 'package:bluedog_client/vehicles/vehicle/vehicle_form.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class VehicleScreen extends StatelessWidget {
  final Vehicle vehicle;
  final bool isMasterDetailComponent;

  VehicleScreen({
    @required this.vehicle,
    @required this.isMasterDetailComponent,
  }) : assert(isMasterDetailComponent != null);

  bool get isUnselectedMasterDetail =>
      isMasterDetailComponent && vehicle == null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !isUnselectedMasterDetail
          ? AppBar(
              title: Text(vehicle?.name ?? ''),
              centerTitle: false,
              automaticallyImplyLeading: !isMasterDetailComponent,
              // TODO: Dynamically switch themes based on size (mobile gets blue bar???)
              // backgroundColor: ThemeColors.primaryColor, // TODO: Testing
              actions: [
                if (vehicle != null)
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // TODO: Implement
                    },
                  ),
              ],
            )
          : null,
      body: !isUnselectedMasterDetail
          ? VehicleForm(
              vehicle: vehicle,
            )
          : Center(
              // TODO: Add an "add" button
              child: Text('No Vehicle Selected'), // TODO: I10N
            ),
    );
  }
}
