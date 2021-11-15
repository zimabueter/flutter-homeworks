import 'package:flutter/material.dart';
import 'package:midtermtask/data/model/dummy_data.dart';
import 'package:midtermtask/screens/add_new_clothes_screen.dart';
import 'package:midtermtask/screens/clothes_details_screen.dart';
import 'package:midtermtask/screens/edit_clothes_screen.dart';
import 'package:midtermtask/widgets/main_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clothes App"),
      ),
      body: GridView.builder(
          padding: EdgeInsets.only(
              left: size.width * 0.05,
              right: size.width * 0.05,
              top: size.height * 0.05,
              bottom: size.height * 0.05),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 40,
            mainAxisSpacing: 40,
          ),
          itemCount: DUMMY_DATA.length,
          itemBuilder: (ctx, index) {
            var clothesItem = DUMMY_DATA[index];
            return GestureDetector(
                onTap: () => Navigator.pushNamed(
                            context, ClothesDetailsScreen.routeName,
                            arguments: clothesItem)
                        .then((_) {
                      setState(() {});
                    }),
                onLongPress: () => Navigator.pushNamed(
                      context,
                      EditClothesScreen.routeName,
                      arguments: {"clothes": clothesItem, "index": index},
                    ).then((_) {
                      setState(() {});
                    }),
                child: MainListItem(
                  name: clothesItem.name,
                  imageUrl: clothesItem.imageUrl,
                  price: clothesItem.price.toString(),
                ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddNewClothesScreen.routeName)
              .then((value) => {
                    setState(() {}),
                  });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
