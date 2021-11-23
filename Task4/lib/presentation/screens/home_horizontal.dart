import 'package:flutter/cupertino.dart';
import 'package:hometask1/presentation/widgets/button.dart';
import 'package:hometask1/presentation/widgets/desc.dart';
import 'package:hometask1/presentation/widgets/img_urls.dart';
import 'package:hometask1/providers/provider_animal.dart';
import 'package:provider/provider.dart';

class HomeHorizontal extends StatelessWidget {
  const HomeHorizontal({Key? key})
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
                nameOfAnimal: context.watch<ProviderAnimal>().getAnimal,
              ),
              Desc(desc: context.watch<ProviderAnimal>().description),
            ])),
        Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Button(
                      content: 'dog',
                    ),
                    Button(content: 'cat',)
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Button(
                      content: 'zebra',
                    ),
                    Button(content: 'horse'),
                  ],
                )
              ],
            )),
      ],
    );
  }
}