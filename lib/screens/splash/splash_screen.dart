import 'package:adcda_volunteers_mobile/controller/splash_controller.dart';
import 'package:adcda_volunteers_mobile/widgets/app_logo.dart';
import 'package:adcda_volunteers_mobile/widgets/cover_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Stack(
          children: [CoverImage(), Center(child: appLogoLg(context))],
        );
      },
    );
  }
}
