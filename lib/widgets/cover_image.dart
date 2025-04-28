import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({super.key, this.opcity});
  final String? opcity;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      opcity == "200"
          ? "assets/images/bg_cover_container-200.jpg"
          : "assets/images/bg_cover_container.jpg",
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }
}
