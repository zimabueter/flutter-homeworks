import 'package:flutter/material.dart';
import 'package:task6/presentation/screens/google_map_screen.dart';
import 'package:task6/presentation/screens/home_screen.dart';
import 'package:task6/providers/state_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (ctx) => StateProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Wonders',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {Maps.routeName: (context) => const Maps()},
      home: const HomeScreen(),
    );
  }
}
