import 'package:final_flutter/data/repositories/expenses_repo.dart';
import 'package:final_flutter/presentation/router/app_routers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ExpenseRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
          primaryColor: const Color(0xff95d3c4), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff95d3c4)),

        ),
        title: 'flutter expenses - firebase',
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
