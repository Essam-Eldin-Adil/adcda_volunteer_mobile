import 'package:adcda_volunteers_mobile/screens/home/home_screen.dart';
import 'package:adcda_volunteers_mobile/widgets/app_header.dart';
import 'package:adcda_volunteers_mobile/widgets/app_logo.dart';
import 'package:adcda_volunteers_mobile/widgets/custom_button.dart';
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
          Image.asset(
            "assets/images/bg_cover_container.jpg",
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              appHeader(context),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const SizedBox(height: 90),
                    Expanded(
                      child: Text(
                        'Welcome To'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(flex: 2, child: appLogoLg(context)),
                    const SizedBox(height: 20),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: BoxedButton(
                                label: 'Training code',
                                onPressed: () {},
                                icon:
                                    'assets/images/svg/training_code_icon.svg',
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: BoxedButton(
                                label: 'Login',
                                onPressed: () {
                                  Get.offAll(HomeScreen());
                                },
                                icon: 'assets/images/svg/login_icon.svg',
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: BoxedButton(
                                label: 'Be a member',
                                onPressed: () {},
                                icon: 'assets/images/svg/be_member_icon.svg',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 1),
              // Expanded(flex: 2, child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }
}
