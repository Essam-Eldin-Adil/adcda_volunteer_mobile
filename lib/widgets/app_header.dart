import 'package:adcda_volunteers_mobile/core/theme/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget appHeader(BuildContext context) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/images/svg/adg_logo.svg',
              width: Responsive.width(40, context),
            ),
            Image.asset(
              'assets/images/adcda_logo.png',
              width: Responsive.width(37, context),
              //height: Responsive.height(35, context),
            ),
          ],
        ),
      ),
    ),
  );
}
