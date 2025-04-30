import 'package:adcda_volunteers_mobile/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Constant {
  static const String userData = "user_data";
  static const int animationDuration = 1000;

  static Widget loader() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.fourRotatingDots(
            color: AppColors.primary,
            size: 60,
          ),
          Text(
            'Please wait...'.tr,
            style: TextStyle(fontSize: 16, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
