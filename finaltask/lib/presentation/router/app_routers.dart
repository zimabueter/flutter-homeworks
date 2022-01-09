import 'package:final_flutter/presentation/screens/home_screen.dart';
import 'package:final_flutter/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';


class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (_) => LoginScreen());
    } else if (settings.name == '/home') {
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    } else {
      return null;
    }
  }
}
