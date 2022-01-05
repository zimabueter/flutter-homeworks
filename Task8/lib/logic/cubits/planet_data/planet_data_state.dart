part of 'planet_data_cubit.dart';

abstract class PlanetDataState {
  const PlanetDataState();
}

class PlanetDataInitial extends PlanetDataState {

}

class PlanetDataLoaded extends PlanetDataState {
  final Planet planet;

  PlanetDataLoaded({required this.planet});

}

class PlanetDataError extends PlanetDataState {
  final String message;

  PlanetDataError({required this.message});
}
