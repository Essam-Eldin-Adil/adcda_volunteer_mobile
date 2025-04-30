import 'dart:async';

import 'package:adcda_volunteers_mobile/core/constants/constant.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class WelcomeController extends GetxController {

  RxInt animateDuration = Constant.animationDuration.obs;
  RxInt animateDelay = 0.obs;

  RxBool isLoading = false.obs;
  RxString loadingText = 'Loading...'.obs;
  
  @override
  void onInit() {
    super.onInit();
   Timer(const Duration(microseconds: 1), () => isLoading.value=false);
  }
  
  int geyDelay() {
    var value = animateDelay.value;
    animateDelay.value += 150;
    return value;
  }
}