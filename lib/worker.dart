import 'package:google_maps_flutter/google_maps_flutter.dart';

class Worker {
  String id;
  String phoneNumber;

  LatLng location;
  String name;

  Worker(
      {required this.id,
      required this.phoneNumber,
      required this.location,
      required this.name});
}
