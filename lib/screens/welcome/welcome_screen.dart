import 'package:adcda_volunteers_mobile/core/theme/responsive.dart';
import 'package:adcda_volunteers_mobile/screens/auth/login_screen.dart';
import 'package:adcda_volunteers_mobile/screens/home/home_screen.dart';
import 'package:adcda_volunteers_mobile/widgets/app_header.dart';
import 'package:adcda_volunteers_mobile/widgets/app_logo.dart';
import 'package:adcda_volunteers_mobile/widgets/cover_image.dart';
import 'package:adcda_volunteers_mobile/widgets/custom_button.dart';
import 'package:adcda_volunteers_mobile/widgets/language_switch_button.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          CoverImage(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                appHeader(context),
                SizedBox(height: Responsive.height(4.39, context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LanguageSwitchButton(),
                    appLogo(context, width: 27.50),
                  ],
                ),

                Column(
                  children: [
                    SizedBox(height: Responsive.height(13.08, context)),
                    FadeInUpBig(
                      duration: Duration(milliseconds: 1000),
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
                          duration: Duration(milliseconds: 1000),
                          delay: Duration(milliseconds: 200),
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
                          duration: Duration(milliseconds: 1000),
                          delay: Duration(milliseconds: 400),
                          child: BorderedButton(
                            label: 'Be a member'.tr,
                            onPressed: () {
                              Get.offAll(HomeScreen());
                            },
                            icon: 'assets/images/svg/be_member_icon.svg',
                          ),
                        ),
                        SizedBox(height: Responsive.height(1.36, context)),
                        FadeInUpBig(
                          duration: Duration(milliseconds: 1000),
                          delay: Duration(milliseconds: 600),
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
                // Expanded(flex: 2, child: SizedBox()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
