import 'package:adcda_volunteers_mobile/controller/otp_controller.dart';
import 'package:adcda_volunteers_mobile/core/theme/responsive.dart';
import 'package:adcda_volunteers_mobile/widgets/app_header.dart';
import 'package:adcda_volunteers_mobile/widgets/background_container.dart';
import 'package:adcda_volunteers_mobile/widgets/curved_card.dart';
import 'package:adcda_volunteers_mobile/widgets/custom_button.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return GetX<OtpController>(
      init: OtpController(),
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
                title: 'OTP'.tr,
                delay: controller.geyDelay(),
                duration: controller.animateDuration.value,
                height: Responsive.height(100, context) - Responsive.height(20, context),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInUpBig(
                          duration: Duration(milliseconds: controller.animateDuration.value),
                          delay: Duration(milliseconds: controller.geyDelay()),
                          child: Text(
                            'Verifiy your phone number'.tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: Responsive.height(0.0, context)),
                        FadeInUpBig(
                          duration: Duration(milliseconds: controller.animateDuration.value),
                          delay: Duration(milliseconds: controller.geyDelay()),
                          child: RadioListTile<String>(
                          title: Text(controller.selectedOptionEnc.value,style: TextStyle(color: Colors.white)),
                          value: controller.selectedOption.value,
                          groupValue: controller.selectedOption.value,
                          activeColor: Colors.white,
                          onChanged: (String? value) {
                            setState(() {
                              //_selectedOption = value;
                            });
                          }),
                        ),
                        SizedBox(height: Responsive.height(1.88, context)),
                        
                        FadeInUpBig(
                          duration: Duration(milliseconds: controller.animateDuration.value),
                          delay: Duration(milliseconds: controller.geyDelay()),
                          child: Row(children: [
                            Expanded(
                              child: CustomButton(
                              label: 'Send OTP'.tr,
                              onPressed: () {
                                controller.resend();
                              }),
                            ),
                            SizedBox(width: Responsive.width(7, context)),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${'Resend OTP in:'.tr} ${controller.formatTime(controller.secondsRemaining.value)}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 9.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Didn’t get the OTP?'.tr,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 9.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextButton(onPressed: (){controller.resend();}, child: Text('Resend'.tr,style: TextStyle(color:controller.canResend.value? Colors.white:Colors.grey,fontSize: 9.0,))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],),
                        ),
                        
                        SizedBox(height: Responsive.height(1.88, context)),
                         FadeInUpBig(
                          duration: Duration(milliseconds: controller.animateDuration.value),
                          delay: Duration(milliseconds: controller.geyDelay()),
                           child: Text(
                            'Enter OTP'.tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                                                   ),
                         ),
                        SizedBox(height: Responsive.height(0.80, context)),
                        FadeInUpBig(
                          duration: Duration(milliseconds: controller.animateDuration.value),
                          delay: Duration(milliseconds: controller.geyDelay()),
                          child: Pinput(
                            length: 6,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            defaultPinTheme: PinTheme(
                              width: 56,
                              height: 56,
                              textStyle: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: LinearGradient(colors: [
                                  Color(0x385B6F80),
                                  Color(0x385B6F80),
                                ]),
                                border: Border.all(color: Color(0x385B6F80)),
                              ),
                            ),
                            onCompleted: (pin) => print(pin),
                          ),
                        ),
                        SizedBox(height: Responsive.height(4.88, context)),
                        FadeInUpBig(
                          duration: Duration(milliseconds: controller.animateDuration.value),
                          delay: Duration(milliseconds: controller.geyDelay()),
                          child: CustomButton(
                            label: 'Verify'.tr,
                            onPressed: () {
                              //controller.login();
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