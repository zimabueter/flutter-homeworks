import 'package:flutter/material.dart';
import 'package:midtermtask/screens/add_new_clothes_screen.dart';
import 'package:midtermtask/screens/clothes_details_screen.dart';
import 'package:midtermtask/screens/edit_clothes_screen.dart';
import 'package:midtermtask/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Levan Abuladze - Clothes App',
      theme: ThemeData(
        backgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
          ),
        ),
        appBarTheme: const AppBarTheme(centerTitle: true), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
      ),
      home: const HomeScreen(),
      routes: {
        ClothesDetailsScreen.routeName: (ctx) => const ClothesDetailsScreen(),
        AddNewClothesScreen.routeName: (ctx) => AddNewClothesScreen(),
        EditClothesScreen.routeName: (ctx) => const EditClothesScreen(),
      },
    );
  }
}
