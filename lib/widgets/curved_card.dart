import 'package:adcda_volunteers_mobile/core/theme/responsive.dart';
import 'package:adcda_volunteers_mobile/screens/welcome/welcome_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CurvedCard extends StatelessWidget {
  const CurvedCard({super.key, required this.child, this.title, this.height, this.delay, this.duration});
  final Widget child;
  final String? title;
  final double? height;
  final int? delay;
  final int? duration;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        gradient: LinearGradient(
          colors: [Color(0xFF12171A), Color(0xFF5B6F80)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      height: height ?? Responsive.height(100, context) - 50,
      width: double.infinity,
      child:
          title != null
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Responsive.height(2.09, context)),
                    SlideInUp(
                      delay: Duration(milliseconds: delay??0),
                      duration: Duration(milliseconds: duration??600),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.offAll(WelcomeScreen());
                              //Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: Responsive.height(2.09, context)),
                    child,
                  ],
                ),
              )
              : child,
    );
  }
}
