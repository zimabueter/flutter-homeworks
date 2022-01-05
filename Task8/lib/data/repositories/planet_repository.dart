import 'package:dio/dio.dart';
import 'package:task8/data/models/planet.dart';
class PlanetRepository {
  Planet planet  = Planet(gravity: '', name: '', population: '', diameter: '', climate: '', terrain: '');
  Dio dio = Dio();

  Future<Planet> fetchPlanet(String link) async {
    final response = await Dio().get(link);

    if (response.statusCode == 200) {
      planet = Planet.fromJson(response.data);
      return planet;
    }
    return planet;
  }
}