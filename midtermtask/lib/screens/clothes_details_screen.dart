
import 'package:flutter/material.dart';
import 'package:midtermtask/data/model/clothes_model.dart';
import 'package:midtermtask/data/repository/clothes_helper.dart';

class ClothesDetailsScreen extends StatefulWidget {
  static const routeName = "/details-screen";

  const ClothesDetailsScreen({Key? key}) : super(key: key);

  @override
  _ClothesDetailsScreenState createState() => _ClothesDetailsScreenState();
}

class _ClothesDetailsScreenState extends State<ClothesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Clothes clothesItem = ModalRoute.of(context)!.settings.arguments as Clothes;
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
          actions: [
            IconButton(icon: const Icon(Icons.delete, color: Colors.white,), onPressed: () {
              showDialog(context: context, builder: (_) => AlertDialog(
                title: const Text("Are you sure?"),
                content: const Text("Do you really want to delete this clothes item?"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("NO")),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          ClothesRepository().removeClothes(clothesItem.id);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        });
                      },
                      child: const Text("YES")),
                ],
              ));
            })
          ],
        ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: size.width * 0.1, right: size.width * 0.1, top: size.height * 0.07, bottom: size.height * 0.07),
          child: Center(
            child: Column(
              children: [
                FadeInImage(
                  width: double.infinity,
                  height: 500,
                  fit: BoxFit.cover,
                  placeholder:
                  const AssetImage("assets/images/clothes_placeholder.png"),
                  image: NetworkImage(clothesItem.imageUrl),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Name:"),
                    Text(clothesItem.name)
                  ],
                ),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Price:"),
                    Text("${clothesItem.price}\$")
                  ],
                ),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Size:"),
                    Text(clothesItem.size)
                  ],
                ),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(clothesItem.description)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
