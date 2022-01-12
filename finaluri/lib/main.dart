import 'package:final_flutter/presentation/router/app_routers.dart';
import 'package:final_flutter/providers/state_provider.dart';
import 'package:flutter/material.dart';
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
    return ChangeNotifierProvider.value(
      value: StateProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
          primaryColor: const Color(0xff95d3c4),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color(0xff95d3c4)),
        ),
        title: 'flutter expenses',
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
