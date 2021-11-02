import 'package:flutter/material.dart';
import 'package:hometask1/presentation/screens/home_horizontal.dart';
import 'package:hometask1/presentation/screens/home_vertical.dart';



var animalDescription = {
  'zebra':
  'Zebras have black fur with white stripes and predominantly white bellies',
  'cat':
  'Cat has a strong flexible body, quick reflexes, sharp teeth and retractable claws adapted to killing small prey',
  'dog':
  'Dogs are domesticated mammals, not natural wild animals. They were originally bred from wolves.',
  'horse':
  'Horses have long necks, long legs, and singular solid hooves on the ends of their feet.'
};


String animalName = "zebra";

void main() {
  runApp(const MyApp());
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
  void swapAnimal(String animal) {
    setState(() {
      animalName = animal;
    });
  }

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
              return HomeHorizontal(swapAnimal: swapAnimal);
            } else {
              return HomeVertical(swapAnimal: swapAnimal);
            }


          },
        ));
  }
}
