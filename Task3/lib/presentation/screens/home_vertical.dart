import 'package:flutter/cupertino.dart';
import 'package:hometask1/presentation/widgets/button.dart';
import 'package:hometask1/presentation/widgets/desc.dart';
import 'package:hometask1/presentation/widgets/img_urls.dart';

import '../../main.dart';

class HomeVertical extends StatelessWidget {
  final Function(String animalName) swapAnimal;

  const HomeVertical({Key? key, required this.swapAnimal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImgUrls(
            nameOfAnimal: animalName,
          ),
          Desc(desc: animalDescription[animalName]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(
                content: 'dog',
                onClick: swapAnimal,
              ),
              Button(content: 'cat', onClick: swapAnimal)
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(
                content: 'zebra',
                onClick: swapAnimal,
              ),
              Button(content: 'horse', onClick: swapAnimal),
            ],
          )
        ],
      ),
    );
  }
}
