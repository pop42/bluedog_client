import 'package:bluedog_client/common/constants/breakpoints.dart';
import 'package:bluedog_client/common/models/vehicle.dart';
import 'package:bluedog_client/common/theme/styles.dart';
import 'package:bluedog_client/common/theme/theme_colors.dart';
import 'package:bluedog_client/common/widgets/master_detail_screen.dart';
import 'package:bluedog_client/data/data.dart';
import 'package:bluedog_client/xfiles/v2/vehicle/vehicle_screen.dart';
import 'package:flutter/material.dart';

// TODO: Need to learn how to navigate web pages (different than mobile?)

class VehiclesScreen extends StatefulWidget {
  @override
  _VehiclesScreenState createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
  final _vehicles = Data.vehicles.toList();
  final _selection = ValueNotifier<Vehicle>(null);

  Widget _buildListView(ValueChanged<Vehicle> onSelection) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicles'), // TODO: I10N
      ),
      body: ListView.separated(
        itemCount: _vehicles.length,
        itemBuilder: (context, index) {
          final vehicle = _vehicles[index];

          return ListTile(
            title: Text(vehicle.name),
            onTap: () => onSelection(vehicle),
          );
        },
        separatorBuilder: (context, index) => const Divider(
          height: Styles.dividerHeight,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    print('>>>>>>>>> largeTabletPortrait = ${Breakpoints.largeTabletPortrait}');
    print(
        '>>>>>>>>> largeTabletLandscape = ${Breakpoints.largeTabletLandscape}');
    print('>>>>>>>>> screenWidth = $screenWidth');

    // TODO: Remove LayoutBuilder if using screenWidth (first test with scaffold wrapper)
    return LayoutBuilder(
      builder: (context, constraints) {
        print('>>>>>>>>> constraints = $constraints');
        print('>>>>>>>>> constraints.maxWidth = ${constraints.maxWidth}');

        // TODO: screenWidth vs constraints.maxWidth???
        if (screenWidth >= Breakpoints.largeTabletPortrait) {
          return MasterDetailScreen(
            master: _buildListView((vehicle) {
              _selection.value = vehicle;
            }),
            detail: ValueListenableBuilder<Vehicle>(
              valueListenable: _selection,
              builder: (context, value, child) {
                if (value == null) {
                  return Scaffold(
                    appBar: AppBar(), // TODO: ???
                    body: Center(
                      child: Text('No Contact Selected'), // TODO: I10N
                    ),
                  );
                }

                return VehicleScreen(
                  vehicle: value,
                );
              },
            ),
          );

          return Row(
            children: <Widget>[
              Container(
                width: 300.0, // TODO: Make constant
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: ThemeColors.sectionDividerColor,
                    ),
                  ),
                ),
                child: _buildListView((vehicle) {
                  _selection.value = vehicle;
                }),
              ),
              Expanded(
                child: ValueListenableBuilder<Vehicle>(
                  valueListenable: _selection,
                  builder: (context, value, child) {
                    if (value == null) {
                      return Scaffold(
                        appBar: AppBar(), // TODO: ???
                        body: Center(
                          child: Text('No Contact Selected'), // TODO: I10N
                        ),
                      );
                    }

                    return VehicleScreen(
                      vehicle: value,
                    );
                  },
                ),
              )
            ],
          );
        }

        return _buildListView((vehicle) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => VehicleScreen(
                  vehicle: vehicle,
                ),
              ));
        });
      },
    );
  }
}
