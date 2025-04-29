import 'dart:math';

import 'package:adcda_volunteers_mobile/core/constants/colors.dart';
import 'package:adcda_volunteers_mobile/core/theme/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.darkBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class UAEPassButton extends StatelessWidget {
  final VoidCallback onPressed;

  const UAEPassButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/UAEPASS_AR.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Container(width: double.infinity),
      ),
    );
  }
}

class BorderedButton extends StatelessWidget {
  final String label;
  final String icon;
  final VoidCallback onPressed;

  const BorderedButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Responsive.height(7.85, context),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: AppColors.darkBackground,
        borderRadius: BorderRadius.circular(20),
        // border: DashedRectBorder(
        //   color: Colors.white,
        //   strokeWidth: 2.0,
        //   dashLength: 3.0,
        //   dashGap: 5.0,
        // ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(Responsive.height(1.36, context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
              SizedBox(width: Responsive.width(2.05, context)),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
