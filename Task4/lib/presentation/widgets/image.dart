import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  final String imageURL;

  const Images({Key? key, required this.imageURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    final bool isVertical = orientation == Orientation.portrait;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        imageURL,
        width: isVertical ? 310 : 210,
        height: isVertical ? 210 : 160,
        fit: BoxFit.fill,
      ),
    );
  }
}
