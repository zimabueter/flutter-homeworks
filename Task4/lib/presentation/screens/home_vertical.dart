import 'package:flutter/cupertino.dart';
import 'package:hometask1/presentation/widgets/button.dart';
import 'package:hometask1/presentation/widgets/desc.dart';
import 'package:hometask1/presentation/widgets/img_urls.dart';
import 'package:hometask1/providers/provider_animal.dart';
import 'package:provider/provider.dart';

class HomeVertical extends StatelessWidget {


  const HomeVertical({Key? key, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImgUrls(
            nameOfAnimal: context.watch<ProviderAnimal>().getAnimal,
          ),
          Desc(desc: context.watch<ProviderAnimal>().description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Button(
                content: 'dog',
              ),
              Button(content: 'cat', )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Button(
                content: 'zebra',
          
              ),
              Button(content: 'horse',),
            ],
          )
        ],
      ),
    );
  }
}
