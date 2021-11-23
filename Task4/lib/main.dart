import 'package:flutter/material.dart';
import 'package:hometask1/presentation/screens/home_horizontal.dart';
import 'package:hometask1/presentation/screens/home_vertical.dart';
import 'package:hometask1/providers/provider_animal.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(


      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => ProviderAnimal())],
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animals"),
          centerTitle: true,
        ),
        body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            if (orientation == Orientation.landscape) {
              return const HomeHorizontal();
            } else {
              return const HomeVertical();
            }


          },
        ));
  }
}
