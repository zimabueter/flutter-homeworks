import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/logic/cubits/planet_data/planet_data_cubit.dart';

class PeopleDetailsScreen extends StatelessWidget {
  const PeopleDetailsScreen({Key? key, required this.planetLink}) : super(key: key);
  final String planetLink;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Planet"),
      ),
      body: BlocConsumer<PlanetDataCubit, PlanetDataState>(
          listener: (context, state) {
            if (state is PlanetDataError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          }, builder: (context, state) {
        if (state is PlanetDataInitial) {
          BlocProvider.of<PlanetDataCubit>(context).getPlanetData(planetLink);
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PlanetDataLoaded) {

          return Center(
            child: Column(
              children: [
                Text("Name: " + state.planet.name),
                Text("Diameter: " + state.planet.diameter),
                Text("Gravity: " + state.planet.gravity),
                Text("Climate: " + state.planet.climate),
                Text("Terrain: " + state.planet.terrain),
                Text("Population: " + state.planet.population)
              ],
            ),
          );
        }
        else {
          return const Center(
            child: Text('Oops! Something went wrong!'),
          );
        }
      }),
    );
  }
}
