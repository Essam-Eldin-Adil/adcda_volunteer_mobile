import 'package:adcda_volunteers_mobile/controller/login_controller.dart';
import 'package:adcda_volunteers_mobile/core/constants/colors.dart';
import 'package:adcda_volunteers_mobile/core/theme/responsive.dart';
import 'package:adcda_volunteers_mobile/widgets/app_header.dart';
import 'package:adcda_volunteers_mobile/widgets/background_container.dart';
import 'package:adcda_volunteers_mobile/widgets/curved_card.dart';
import 'package:adcda_volunteers_mobile/widgets/custom_button.dart';
import 'package:adcda_volunteers_mobile/widgets/input.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
      body: BackgroundContainer(
        isLoading: controller.isLoading.value,
        loadingText: controller.loadingText.value.tr,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appSubHeader(context),
             SizedBox(height: Responsive.height(4, context)),
             CurvedCard(
                title: 'Login'.tr,
                delay: controller.geyDelay(),
                duration: controller.animateDuration.value,
                height: Responsive.height(100, context) - Responsive.height(20, context),
                child: Column(
                  children: [
                    Column(
                  children: [
                    FadeInUpBig(
                      duration: Duration(milliseconds: controller.animateDuration.value),
                      delay: Duration(milliseconds: controller.geyDelay()),
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
                      duration: Duration(milliseconds: controller.animateDuration.value),
                      delay: Duration(milliseconds: controller.geyDelay()),
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
                      duration: Duration(milliseconds: controller.animateDuration.value),
                      delay: Duration(milliseconds: controller.geyDelay()),
                      child: CaptchaComponent(
                        controller: TextEditingController(),
                        captchaImageBase64:
                             controller.captchaImageBase64.value,
                     onRefresh: controller.refreshCaptcha(),
                      ),
                      
                    ),
                    SizedBox(height: Responsive.height(1.88, context)),
                    FadeInUpBig(
                      duration: Duration(milliseconds: controller.animateDuration.value),
                      delay: Duration(milliseconds: controller.geyDelay()),
                      child: CustomButton(
                        label: 'Login'.tr,
                        onPressed: () {
                          controller.login();
                        },
                      ),
                    ),
                    FadeInUpBig(
                      duration: Duration(milliseconds: controller.animateDuration.value),
                      delay: Duration(milliseconds: controller.geyDelay()),
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
                      duration: Duration(milliseconds: controller.animateDuration.value),
                      delay: Duration(milliseconds: controller.geyDelay()),
                      child: UAEPassButton(
                        onPressed: () {
                          // Handle login action
                        },
                      ),
                    ),
                  ],
                ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
      },
    );
    
    
    
  }
}