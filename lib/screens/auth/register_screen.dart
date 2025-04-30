import 'package:adcda_volunteers_mobile/controller/register_controller.dart';
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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return GetX<RegisterController>(
      init: RegisterController(),
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
                title: 'Register'.tr,
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
                      child: CaptchaComponent(
                        controller: TextEditingController(),
                        captchaImageBase64:controller.captchaImageBase64.value,
                        onRefresh: () {
                          controller.refreshCaptcha();
                        },
                      ),
                    ),
                    SizedBox(height: Responsive.height(1.88, context)),
                    FadeInUpBig(
                      duration: Duration(milliseconds: controller.animateDuration.value),
                      delay: Duration(milliseconds: controller.geyDelay()),
                      child: CustomButton(
                        label: 'Next'.tr,
                        onPressed: () {
                          controller.register();
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
                          // Handle Register action
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