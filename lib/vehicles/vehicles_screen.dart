import 'package:bluedog_client/common/constants/breakpoints.dart';
import 'package:bluedog_client/common/models/vehicle.dart';
import 'package:bluedog_client/common/widgets/master_detail_screen.dart';
import 'package:bluedog_client/vehicles/vehicle/vehicle_screen.dart';
import 'package:bluedog_client/vehicles/vehicle_list_screen.dart';
import 'package:flutter/material.dart';

class VehiclesScreen extends StatefulWidget {
  @override
  _VehiclesScreenState createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
  Vehicle _selectedVehicle;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: screenWidth >= Breakpoints.largeTabletPortrait
          ? MasterDetailScreen(
              master: VehicleListScreen(
                selectedVehicle: _selectedVehicle,
                onSelection: (vehicle) {
                  setState(() => _selectedVehicle = vehicle);
                },
                isMasterDetailComponent: true,
              ),
              detail: VehicleScreen(
                vehicle: _selectedVehicle,
                isMasterDetailComponent: true,
              ),
            )
          : VehicleListScreen(
              onSelection: (vehicle) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => VehicleScreen(
                        vehicle: vehicle,
                        isMasterDetailComponent: false,
                      ),
                    ));
              },
              isMasterDetailComponent: false,
            ),
    );
  }
}
