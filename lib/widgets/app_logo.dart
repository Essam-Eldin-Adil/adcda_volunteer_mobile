import 'package:adcda_volunteers_mobile/core/theme/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget appLogo(BuildContext context, {double? width = 45.45}) {
  return SvgPicture.asset(
    "assets/images/svg/logo.svg",
    width: Responsive.width(width ?? 45.45, context),
  );
}
