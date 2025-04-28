import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/bg_cover_container.jpg",
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }
}
