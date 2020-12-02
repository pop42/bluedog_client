import 'package:quiver/strings.dart';

class Vehicle {
  final String id;
  final String name;

  Vehicle({
    this.id,
    this.name,
  })  : assert(!isBlank(id)),
        assert(!isBlank(name));
}
