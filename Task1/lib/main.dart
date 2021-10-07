import 'package:flutter/material.dart';

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
  String animalName = "zebra";

  void changeAnimal(String animal) {
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
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (animalName == "dog")
              Image.network(
                "https://st.depositphotos.com/2892507/4212/i/950/depositphotos_42123797-stock-photo-easter-dalmatain-puppy.jpg",
                width: 400,
                height: 400,
              ),
            if (animalName == "cat")
              Image.network(
                "https://st2.depositphotos.com/1000877/5947/i/950/depositphotos_59478951-stock-photo-red-kitten.jpg",
                width: 400,
                height: 400,
              ),
            if (animalName == "zebra")
              Image.network(
                "https://static9.depositphotos.com/1013107/1080/i/950/depositphotos_10801592-stock-photo-male-zebra-isolated.jpg",
                width: 400,
                height: 400,
              ),
            if (animalName == "horse")
              Image.network(
                "https://st.depositphotos.com/1003660/1320/i/950/depositphotos_13208945-stock-photo-black-friesian-horse-gallop.jpg",
                width: 400,
                height: 400,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      changeAnimal("dog");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        fixedSize: const Size(110, 30)),
                    child: const Text("Dog")),
                ElevatedButton(
                    onPressed: () {
                      changeAnimal("cat");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        fixedSize: const Size(110, 30)),
                    child: const Text("Cat"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      changeAnimal("zebra");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        fixedSize: const Size(110, 30)),
                    child: const Text("Zebra")),
                ElevatedButton(
                    onPressed: () {
                      changeAnimal("horse");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        fixedSize: const Size(110, 30)),
                    child: const Text("Horse")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
