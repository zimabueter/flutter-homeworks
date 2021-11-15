import 'package:flutter/material.dart';

class MainListItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String price;

   const MainListItem(
      {Key? key, required this.name, required this.imageUrl, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: FadeInImage(
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder:
                const AssetImage("assets/images/clothes_placeholder.png"),
            image: NetworkImage(imageUrl),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 8),
          child: Column(
            children: [
              Row(children: [Text(name),]),
              Row(children: [Text("$price\$"),]),
            ],
          ),
        )
      ],
    );
  }
}
