import 'package:flutter/material.dart';
import 'package:task8/presentation/screens/home_screen.dart';
import 'package:task8/presentation/screens/people_details_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    } else if (settings.name == '/people-details') {
      var planetLink = settings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => PeopleDetailsScreen(planetLink: planetLink));
    }else {
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
