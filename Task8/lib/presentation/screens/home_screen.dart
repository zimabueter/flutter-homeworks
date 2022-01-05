import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/logic/cubits/people_data/people_data_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('People')
      ),
      body: BlocConsumer<PeopleDataCubit, PeopleDataState>(
        listener: (context, state) {
          if (state is PeopleDataError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is PeopleDataInitial) {
            BlocProvider.of<PeopleDataCubit>(context).getPeopleData();

            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PeopleDataLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                var people = state.peopleList[index];
                return ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/people-details', arguments: people.homeworld);
                  },
                  title: Text("Name: " + people.name),
                  subtitle: Text("Homeworld: " + people.homeworld),
                );
              },
              itemCount: state.peopleList.length,
            );
          } else {
            return const Center(
              child: Text('Ops! Something went wrong!'),
            );
          }
        },
      )
    );
  }
}
