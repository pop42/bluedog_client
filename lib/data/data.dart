import 'package:bluedog_client/common/models/vehicle.dart';

abstract class Data {
  static List<Vehicle> get vehicles => [
        Vehicle(
          id: '1',
          name: 'Vehicle A',
        ),
        Vehicle(
          id: '2',
          name: 'Vehicle B',
        ),
        Vehicle(
          id: '3',
          name: 'Vehicle C',
        ),
      ];
}
