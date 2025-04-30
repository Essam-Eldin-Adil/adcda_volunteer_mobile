import 'dart:async';

//import 'package:ebc_mobile/utils/fire_store_utils.dart';
import 'package:adcda_volunteers_mobile/core/utils/Preferences.dart';
import 'package:adcda_volunteers_mobile/screens/home/home_screen.dart';
import 'package:adcda_volunteers_mobile/screens/on_boarding/on_boarding_screen.dart';
import 'package:adcda_volunteers_mobile/screens/welcome/welcome_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () => redirectScreen());
    super.onInit();
  }

  redirectScreen() async {
    //Get.offAll(const OnBoardingScreen());
    //return;
    if (Preferences.getBoolean(Preferences.isFinishOnBoardingKey) == false) {
      Get.offAll(const OnBoardingScreen());
    } else {
      bool isLogin = false;
      if (isLogin == true) {
        Get.offAll(HomeScreen());
      } else {
        Get.offAll(WelcomeScreen());
      }
    }
  }
}
