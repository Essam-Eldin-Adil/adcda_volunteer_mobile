import 'package:adcda_volunteers_mobile/controller/welcome_controller.dart';
import 'package:adcda_volunteers_mobile/core/theme/responsive.dart';
import 'package:adcda_volunteers_mobile/screens/auth/login_screen.dart';
import 'package:adcda_volunteers_mobile/screens/auth/register_screen.dart';
import 'package:adcda_volunteers_mobile/widgets/app_header.dart';
import 'package:adcda_volunteers_mobile/widgets/background_container.dart';
import 'package:adcda_volunteers_mobile/widgets/custom_button.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<WelcomeController>(
      init: WelcomeController(),
      builder: (controller){
      return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          BackgroundContainer(
            child: Column(
              children: [
                appSubHeader(context),
             //SizedBox(height: Responsive.height(4, context)),
                SizedBox(height: Responsive.height(13.08, context)),
                FadeInUpBig(
                  duration: Duration(milliseconds: controller.animateDuration.value),
                  delay: Duration(milliseconds: controller.geyDelay()),
                  child: Text(
                    'Choose Your Access \n Method'.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: Responsive.height(6.17, context)),
                Column(
                  children: [
                    FadeInUpBig(
                      duration: Duration(milliseconds: controller.animateDuration.value),
                  delay: Duration(milliseconds: controller.geyDelay()),
                      child: BorderedButton(
                        label: 'Login'.tr,
                        onPressed: () {
                          Get.offAll(LoginScreen());
                        },
                        icon: 'assets/images/svg/login_icon.svg',
                      ),
                    ),
                    SizedBox(height: Responsive.height(1.36, context)),
                    FadeInUpBig(
                    duration: Duration(milliseconds: controller.animateDuration.value),
                  delay: Duration(milliseconds: controller.geyDelay()),
                      child: BorderedButton(
                        label: 'Be a member'.tr,
                        onPressed: () {
                          Get.offAll(RegisterScreen());
                        },
                        icon: 'assets/images/svg/be_member_icon.svg',
                      ),
                    ),
                    SizedBox(height: Responsive.height(1.36, context)),
                    FadeInUpBig(
                      duration: Duration(milliseconds: controller.animateDuration.value),
                  delay: Duration(milliseconds: controller.geyDelay()),
                      child: BorderedButton(
                        label: 'Training code'.tr,
                        onPressed: () {},
                        icon: 'assets/images/svg/training_code_icon.svg',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
    });
  }
}
