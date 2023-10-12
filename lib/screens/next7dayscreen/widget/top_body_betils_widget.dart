import 'package:flutter/material.dart';

class TopBodyDetils extends StatelessWidget {
  final String img;
  final double? imgSisz;
  final String title;
  const TopBodyDetils({
    super.key,
    required this.img,
    required this.title,
    this.imgSisz = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
          height: imgSisz,
          width: imgSisz,
          child: Image.asset(
            img,
            fit: BoxFit.cover,
          )),
      Text(
        title,
        style: const TextStyle(
            color: Color(0xFF303345), fontWeight: FontWeight.bold),
      )
    ]);
  }
}
