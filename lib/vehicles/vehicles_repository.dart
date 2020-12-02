import 'package:bluedog_client/common/models/vehicle.dart';
import 'package:postgres/postgres.dart';

/*
    TODO: App throws "Error: Unsupported operation: Socket constructor" when attempting to connect to Postgres database
    TODO: Flutter Web runs within the browser. Browser apps cannot connect to random sockets, only when using the http protocol. Postgresql doesn't have an http interface, therefore you cannot connect to it from Flutter web (or from regular JS web).
      - https://www.gitmemory.com/issue/stablekernel/postgresql-dart/142/718082000
      - https://stackoverflow.com/questions/34605037/uncaught-uncaught-error-unsupported-operation-socket-constructor-in-dart-with
      - https://github.com/stablekernel/postgresql-dart/issues/100
 */

class VehiclesRepository {
  // Future<List<Vehicle>> listVehicles() async {
  Future<List<Vehicle>> listVehicles() async {
    print('VehiclesRepository.listVehicles()...');

    // final connection = PostgreSQLConnection(
    //   "localhost",
    //   5432,
    //   "view_db",
    //   username: "postgres",
    //   password: "Xerifleet2",
    // );
    //
    // await connection.open();
    //
    // List<List<dynamic>> results = await connection.query(
    //   "SELECT a, b FROM table WHERE a = @aValue",
    //   substitutionValues: {
    //     "aValue": 3,
    //   },
    // );
    //
    // for (final row in results) {
    //   var a = row[0];
    //   var b = row[1];
    // }

    // TODO: Move properties to environment variables
    // TODO: How to use connection pool?
    final connection = PostgreSQLConnection(
      '10.0.2.2',
      // TODO: localhost throws "[ERROR:flutter/shell/common/shell.cc(209)] Dart Unhandled Exception: SocketException: OS Error: Connection refused, errno = 111, address = localhost, port = 55366" exception
      // 'localhost',
      5432,
      'view_db',
      username: 'postgres',
      password: 'Xerifleet2',
    );

    print('Connecting to database...');

    await connection.open();

    print('Connected to database');

    final results = await connection.query('select * from vehicles');

    print(results);

    List<Vehicle> vehicles = [];
    for (final row in results) {
      final id = row[0];
      final data = row[1];

      print('''
id: $id
data: $data
name: ${data['name']}

---
    ''');

      vehicles.add(Vehicle(
        id: id,
        name: data['name'],
      ));
    }

    return vehicles;
  }
}
