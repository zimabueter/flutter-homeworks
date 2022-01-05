class Planet {
  late String name;
  String? rotationPeriod;
  String? orbitalPeriod;
  late String diameter;
  late String climate;
  late String gravity;
  late String terrain;
  String? surfaceWater;
  late String population;
  List<String>? residents;
  List<String>? films;
  String? created;
  String? edited;
  String? url;

  Planet(
      {required this.name,
      this.rotationPeriod,
      this.orbitalPeriod,
      required this.diameter,
      required this.climate,
      required this.gravity,
      required this.terrain,
      this.surfaceWater,
      required this.population,
      this.residents,
      this.films,
      this.created,
      this.edited,
      this.url});

  Planet.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rotationPeriod = json['rotation_period'];
    orbitalPeriod = json['orbital_period'];
    diameter = json['diameter'];
    climate = json['climate'];
    gravity = json['gravity'];
    terrain = json['terrain'];
    surfaceWater = json['surface_water'];
    population = json['population'];
    residents = json['residents'].cast<String>();
    films = json['films'].cast<String>();
    created = json['created'];
    edited = json['edited'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['rotation_period'] = rotationPeriod;
    data['orbital_period'] = orbitalPeriod;
    data['diameter'] = diameter;
    data['climate'] = climate;
    data['gravity'] = gravity;
    data['terrain'] = terrain;
    data['surface_water'] = surfaceWater;
    data['population'] = population;
    data['residents'] = residents;
    data['films'] = films;
    data['created'] = created;
    data['edited'] = edited;
    data['url'] = url;
    return data;
  }
}
