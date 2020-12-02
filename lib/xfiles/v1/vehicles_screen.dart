import 'package:bluedog_client/common/constants/breakpoints.dart';
import 'package:bluedog_client/common/models/vehicle.dart';
import 'package:bluedog_client/common/widgets/app/app_scaffold.dart';
import 'package:bluedog_client/common/widgets/master_detail_screen.dart';
import 'package:bluedog_client/data/data.dart';
import 'package:bluedog_client/xfiles/v1/vehicle/vehicle_screen.dart';
import 'package:flutter/material.dart';

// TODO: Need to learn how to navigate web pages (different than mobile?)

class VehiclesScreen extends StatefulWidget {
  @override
  _VehiclesScreenState createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
  Vehicle _selectedVehicle;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AppScaffold(
      body: screenWidth >= Breakpoints.largeTabletPortrait
          ? MasterDetailScreen(
              master: _VehicleList(
                selectedVehicle: _selectedVehicle,
                onSelection: (vehicle) {
                  setState(() => _selectedVehicle = vehicle);
                },
              ),
              detail: VehicleScreen(
                vehicle: _selectedVehicle,
                isMasterDetailLayout: true,
              ),
            )
          : _VehicleList(
              onSelection: (vehicle) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => VehicleScreen(
                        vehicle: vehicle,
                        isMasterDetailLayout: false,
                      ),
                    ));
              },
            ),
    );
  }
}

class _VehicleList extends StatelessWidget {
  final Vehicle selectedVehicle;
  final ValueChanged<Vehicle> onSelection;

  _VehicleList({
    this.selectedVehicle,
    @required this.onSelection,
  }) : assert(onSelection != null);

  @override
  Widget build(BuildContext context) {
    // TODO: Convert to ListView.builder()
    return ListView(
      children: Data.vehicles.map((vehicle) {
        return ListTile(
          title: Text(vehicle.name),
          selected: selectedVehicle == vehicle,
          onTap: () => onSelection(vehicle),
        );
      }).toList(),
    );
  }
}
