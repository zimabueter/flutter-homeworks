import 'package:flutter/cupertino.dart';
import 'package:hometask1/presentation/widgets/button.dart';
import 'package:hometask1/presentation/widgets/desc.dart';
import 'package:hometask1/presentation/widgets/img_urls.dart';

import '../../main.dart';

class HomeHorizontal extends StatelessWidget {
  final Function(String animalName) swapAnimal;
  const HomeHorizontal({Key? key, required this.swapAnimal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              ImgUrls(
                nameOfAnimal: animalName,
              ),
              Desc(desc: animalDescription[animalName]),
            ])),
        Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  height: 40,
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
            )),
      ],
    );
  }
}