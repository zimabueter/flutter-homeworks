import 'package:flutter/cupertino.dart';
import 'package:hometask1/presentation/widgets/image.dart';

class ImgUrls extends StatelessWidget {
  final String nameOfAnimal;
  const ImgUrls({Key? key, this.nameOfAnimal = 'zebra'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (nameOfAnimal == "dog") {
      return const Images(
          imageURL:
          'https://st.depositphotos.com/2892507/4212/i/950/depositphotos_42123797-stock-photo-easter-dalmatain-puppy.jpg');
    }
    if (nameOfAnimal == "cat") {
      return const Images(
          imageURL:
          'https://st2.depositphotos.com/1000877/5947/i/950/depositphotos_59478951-stock-photo-red-kitten.jpg');
    }
    if (nameOfAnimal == "zebra") {
      return const Images(
          imageURL:
          'https://static9.depositphotos.com/1013107/1080/i/950/depositphotos_10801592-stock-photo-male-zebra-isolated.jpg');
    }

    return const Images(
      imageURL:
      'https://st.depositphotos.com/1003660/1320/i/950/depositphotos_13208945-stock-photo-black-friesian-horse-gallop.jpg',
    );
  }
}
