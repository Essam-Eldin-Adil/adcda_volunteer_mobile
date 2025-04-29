import 'package:adcda_volunteers_mobile/core/constants/colors.dart';
import 'package:adcda_volunteers_mobile/core/theme/responsive.dart';
import 'package:adcda_volunteers_mobile/widgets/app_header.dart';
import 'package:adcda_volunteers_mobile/widgets/app_logo.dart';
import 'package:adcda_volunteers_mobile/widgets/cover_image.dart';
import 'package:adcda_volunteers_mobile/widgets/curved_card.dart';
import 'package:adcda_volunteers_mobile/widgets/custom_button.dart';
import 'package:adcda_volunteers_mobile/widgets/input.dart';
import 'package:adcda_volunteers_mobile/widgets/language_switch_button.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CoverImage(opcity: "200"),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: appHeader(context),
              ),
              SizedBox(height: Responsive.height(4.39, context)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LanguageSwitchButton(),
                    appLogo(context, width: 27.50),
                  ],
                ),
              ),
              SizedBox(height: Responsive.height(4.47, context)),
              Expanded(
                child: CurvedCard(
                  title: 'Login'.tr,
                  child: Column(
                    children: [
                      FadeInUpBig(
                        duration: Duration(milliseconds: 1000),
                        delay: Duration(milliseconds: 200),
                        child: CustomInputField(
                          label: 'Username / Email'.tr,
                          hintText: 'Example@gmail.com',
                          inputType: TextInputType.name,
                          controller: TextEditingController(),
                          icon: Icons.person,
                        ),
                      ),
                      SizedBox(height: Responsive.height(1.88, context)),
                      FadeInUpBig(
                        duration: Duration(milliseconds: 1000),
                        delay: Duration(milliseconds: 400),
                        child: CustomInputField(
                          label: 'Password'.tr,
                          hintText: 'Enter password'.tr,
                          inputType: TextInputType.name,
                          controller: TextEditingController(),
                          icon: Icons.lock,
                        ),
                      ),
                      SizedBox(height: Responsive.height(1.88, context)),
                      FadeInUpBig(
                        duration: Duration(milliseconds: 1000),
                        delay: Duration(milliseconds: 1000),
                        child: CaptchaComponent(
                          controller: TextEditingController(),
                          captchaImageBase64:
                              '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',
                        ),
                      ),
                      SizedBox(height: Responsive.height(1.88, context)),
                      FadeInUpBig(
                        duration: Duration(milliseconds: 1000),
                        delay: Duration(milliseconds: 800),
                        child: CustomButton(
                          label: 'Login'.tr,
                          onPressed: () {
                            // Handle login action
                          },
                        ),
                      ),
                      FadeInUpBig(
                        duration: Duration(milliseconds: 1000),
                        delay: Duration(milliseconds: 900),
                        child: SizedBox(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Responsive.height(0.8, context),
                            ),
                            child: Center(
                              child: Text(
                                'Or'.tr,
                                style: TextStyle(
                                  color: AppColors.subTitleColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      FadeInUpBig(
                        duration: Duration(milliseconds: 1000),
                        delay: Duration(milliseconds: 1000),
                        child: UAEPassButton(
                          onPressed: () {
                            // Handle login action
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
