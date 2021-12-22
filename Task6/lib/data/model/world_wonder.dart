import 'package:google_maps_flutter/google_maps_flutter.dart';

class WorldWonder {
  final String name;
  final String desc;
  final LatLng latLong;

  WorldWonder({
    required this.name,
    required this.desc,
    required this.latLong,
  });
}