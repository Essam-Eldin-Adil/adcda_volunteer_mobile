
import 'package:adcda_volunteers_mobile/core/constants/constant.dart';
import 'package:adcda_volunteers_mobile/core/theme/responsive.dart';
import 'package:adcda_volunteers_mobile/widgets/app_logo.dart';
import 'package:adcda_volunteers_mobile/widgets/language_switch_button.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget appHeader(BuildContext context) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ZoomIn(
              duration: const Duration(milliseconds: Constant.animationDuration),
              delay: const Duration(milliseconds: 0),
              child: SvgPicture.asset(
                'assets/images/svg/adg_logo.svg',
                width: Responsive.width(40, context),
              ),
            ),
            ZoomIn(
              duration: const Duration(milliseconds: Constant.animationDuration),
              delay: const Duration(milliseconds: 0),
              child: Image.asset(
                'assets/images/adcda_logo.png',
                width: Responsive.width(37, context),
                //height: Responsive.height(35, context),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


Widget appSubHeader(BuildContext context) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LanguageSwitchButton(),
                    appLogo(context, width: 27.50),
                  ],
                ),
    ),
  );
}