import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/logic/cubits/people_data/people_data_cubit.dart';
import 'package:task8/logic/cubits/planet_data/planet_data_cubit.dart';
import 'package:task8/presentation/router/app_router.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PeopleDataCubit>(
          create: (context) => PeopleDataCubit(),
        ),
        BlocProvider<PlanetDataCubit>(
          create: (context) => PlanetDataCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter REST API',
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
