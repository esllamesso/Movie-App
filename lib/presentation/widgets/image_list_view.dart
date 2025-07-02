import 'package:flutter/material.dart';

class ImageListView extends StatelessWidget {
  final List<String> image = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 106,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: image.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                image[index],
                width: 142,
                height: 106,
                fit: BoxFit.cover,

              ),
            ),
          );
        },
      ),
    );
  }
}