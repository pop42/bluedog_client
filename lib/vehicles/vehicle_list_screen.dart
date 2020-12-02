import 'package:bluedog_client/common/models/vehicle.dart';
import 'package:bluedog_client/common/widgets/widget_divider.dart';
import 'package:bluedog_client/data/data.dart';
import 'package:bluedog_client/vehicles/vehicles_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

class VehicleListScreen extends StatefulWidget {
  final Vehicle selectedVehicle;
  final ValueChanged<Vehicle> onSelection;
  final bool isMasterDetailComponent;

  VehicleListScreen({
    this.selectedVehicle,
    @required this.onSelection,
    @required this.isMasterDetailComponent,
  })  : assert(onSelection != null),
        assert(isMasterDetailComponent != null);

  @override
  _VehicleListScreenState createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends State<VehicleListScreen> {
  SearchBar _searchBar;

  @override
  void initState() {
    super.initState();

    _searchBar = SearchBar(
      inBar: true,
      setState: setState,
      buildDefaultAppBar: _buildAppBar,
      // TODO: I10N
      hintText: 'Search',
      onChanged: (value) {
        // TODO: Implement
      },
      onSubmitted: (value) {
        // TODO: Implement
      },
      onCleared: () {
        // TODO: Implement
      },
      onClosed: () {
        // TODO: Implement
      },
      showClearButton: true,
      clearOnSubmit: false,
      closeOnSubmit: false,
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Vehicles'), // TODO: I10N
      centerTitle: false,
      // TODO: Dynamically switch themes based on size (mobile gets blue bar???)
      // backgroundColor: ThemeColors.primaryColor, // TODO: Testing
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            // TODO: Implement
          },
        ),
        IconButton(
          icon: Icon(Icons.filter_alt_sharp),
          onPressed: () {
            // TODO: Implement
          },
        ),
        _searchBar.getSearchAction(context),
      ],
    );
  }

  ListView _buildVehicleList() {
    final vehicles = Data.vehicles.toList();

    // TODO: START: Testing... Doesn't work with web, but does with phone/tablet
    VehiclesRepository().listVehicles();
    // final vehicles = await VehiclesRepository().listVehicles();
    // TODO: END: Testing... Doesn't work with web, but does with phone/tablet

    return ListView.separated(
      itemCount: vehicles.length,
      itemBuilder: (context, index) {
        final vehicle = vehicles[index];

        return ListTile(
          title: Text(vehicle.name),
          selected: widget.selectedVehicle?.id == vehicle.id,
          onTap: () => widget.onSelection(vehicle),
        );
      },
      separatorBuilder: (context, index) => WidgetDivider(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _searchBar.build(context),
      body: _buildVehicleList(),
    );
  }
}
