import 'dart:async';

import 'package:adcda_volunteers_mobile/core/constants/colors.dart';
import 'package:adcda_volunteers_mobile/core/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {

  RxInt animateDuration = Constant.animationDuration.obs;
  RxInt animateDelay = 0.obs;
  RxBool isLoading = false.obs;
  RxString loadingText = 'Loading...'.obs;
  RxString selectedOption = '0505122426'.obs;
  RxString selectedOptionEnc = '***426'.obs;
  RxString resendTimer = '00:00'.obs;
  RxList<String> registredNumbers = ['0505122426','0565852606'].obs;

  @override
  void onInit() {
    super.onInit();
   Timer(const Duration(microseconds: 1), () => isLoading.value=false);

  }

  register() async {
    //isLoading.value=true;
    //Timer(const Duration(seconds: 3), () => isLoading.value=false);
    Get.snackbar('Success', 'Registration successful!',snackPosition: SnackPosition.BOTTOM,margin: EdgeInsets.all(20),backgroundColor: AppColors.success,colorText: Colors.white);
    //Get.offAll(OtpScreen());
  }
  
  int geyDelay() {
    var value = animateDelay.value;
    animateDelay.value += 150;
    return value;
  }

  resend(){
    startTimer();
    Get.snackbar('Success', 'Resend OTP successful!',snackPosition: SnackPosition.BOTTOM,margin: EdgeInsets.all(20),backgroundColor: AppColors.success,colorText: Colors.white);
  }

  RxInt secondsRemaining = 30.obs; // Initial countdown time in seconds
  RxBool canResend = false.obs; // Controls whether the resend button is enabled
  Timer? myTimer;

  void startTimer() {
    canResend.value = false;
    secondsRemaining.value = 30;

    myTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining == 0) {
        //setState(() {
          canResend.value = true;
          timer.cancel();
        //});
      } else {
        //setState(() {
          secondsRemaining--;
        //});
      }
    });
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

}