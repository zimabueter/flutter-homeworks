import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:task6/data/world_wonders.dart';

class StateProvider extends ChangeNotifier {
  String _name = '';
  String _description = '';
  LatLng _latLong = const LatLng(0, 0);

  String get name => _name;

  String get description => _description;

  LatLng get latLong => _latLong;

  void changeState(String name, String description, LatLng latLng) {
    _name = name;
    _description = description;
    _latLong = latLng;
    notifyListeners();
  }

  List<WorldWonder> getWonders() {
    return worldWondersList;
  }
}
