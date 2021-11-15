import 'package:flutter/material.dart';
import 'package:midtermtask/data/model/clothes_model.dart';
import 'package:midtermtask/data/repository/clothes_helper.dart';
import 'package:midtermtask/widgets/clothes_text_form_field.dart';


class EditClothesScreen extends StatefulWidget {
  static const routeName = "/edit-clothes-screen";

  const EditClothesScreen({Key? key}) : super(key: key);

  @override
  _EditClothesScreenState createState() => _EditClothesScreenState();
}

class _EditClothesScreenState extends State<EditClothesScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController clothesID;
  late TextEditingController clothesName;
  late TextEditingController clothesImageUrl;
  late TextEditingController clothesSize;
  late TextEditingController clothesPrice;
  late TextEditingController clothesDescription;

  @override
  Widget build(BuildContext context) {
    final Map parsedData = ModalRoute.of(context)!.settings.arguments as Map;
    final Clothes clothes = parsedData["clothes"];
    final int index = parsedData["index"];

    clothesID = TextEditingController(text: clothes.id.toString());
    clothesName = TextEditingController(text: clothes.name);
    clothesImageUrl = TextEditingController(text: clothes.imageUrl);
    clothesSize = TextEditingController(text: clothes.size);
    clothesPrice = TextEditingController(text: clothes.price.toString());
    clothesDescription = TextEditingController(text: clothes.description);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                ClothesTextFormField(
                  controller: clothesID,
                  textInputType: TextInputType.number,
                  hintText: "Please enter ID",
                  errorText: "Please enter valid ID",
                ),
                const SizedBox(
                  height: 16,
                ),
                ClothesTextFormField(
                  controller: clothesName,
                  textInputType: TextInputType.text,
                  hintText: "Please enter name",
                  errorText: "Please enter valid name",
                ),
                const SizedBox(
                  height: 16,
                ),
                ClothesTextFormField(
                  controller: clothesImageUrl,
                  textInputType: TextInputType.text,
                  hintText: "Please enter image",
                  errorText: "Please enter valid image",
                ),
                const SizedBox(
                  height: 16,
                ),
                ClothesTextFormField(
                  controller: clothesSize,
                  textInputType: TextInputType.text,
                  hintText: "Please enter size",
                  errorText: "Please enter valid size",
                ),
                const SizedBox(
                  height: 16,
                ),
                ClothesTextFormField(
                  controller: clothesPrice,
                  textInputType: TextInputType.number,
                  hintText: "Please enter price",
                  errorText: "Please enter valid price",
                ),
                const SizedBox(
                  height: 16,
                ),
                ClothesTextFormField(
                  controller: clothesDescription,
                  textInputType: TextInputType.text,
                  hintText: "Please enter description",
                  errorText: "Please enter valid description",
                ),
                Container(
                  margin: const EdgeInsets.only(top: 240),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 128,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Back"),
                        ),
                      ),
                      SizedBox(
                        width: 128,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Clothes clothes = Clothes(
                                  id: int.tryParse(clothesID.text),
                                  name: clothesName.text,
                                  imageUrl: clothesImageUrl.text,
                                  size: clothesSize.text,
                                  price: double.parse(clothesPrice.text),
                                  description: clothesDescription.text);
                              ClothesRepository().editClothes(clothes, index);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text("Edit"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
