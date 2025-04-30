import 'package:adcda_volunteers_mobile/core/theme/responsive.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/utils.dart'; // For Base64 decoding

class CustomInputField extends StatelessWidget {
  final String label;
  final String? hintText;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType inputType;

  const CustomInputField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    required this.inputType,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextField(
          controller: controller,
          keyboardType: inputType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0x94C5C5C5)),
            prefixIcon: Icon(icon, color: Colors.white),
            filled: true,
            fillColor: const Color(0x385B6F80),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 12.0,
            ),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class CaptchaComponent extends StatelessWidget {
  final String captchaImageBase64; // Base64 string for the CAPTCHA image
  final TextEditingController controller; // Controller for the text input
  final Function? onRefresh; // Callback function to refresh the CAPTCHA
  const CaptchaComponent({
    super.key,
    required this.captchaImageBase64,
    required this.controller,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    // Decode the Base64 string to bytes
    final bytes = base64Decode(captchaImageBase64);
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enter Verification code'.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (onRefresh != null) {
                        onRefresh!();
                      }
                    },
                    child: Icon(Icons.refresh, color: Colors.white),
                  )
                ],
              ),
              TextField(
                controller: controller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Captcha'.tr,
                  hintStyle: const TextStyle(color: Color(0x94C5C5C5)),
                  filled: true,
                  fillColor: const Color(0x385B6F80),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 12.0,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(width: Responsive.width(2.56, context)),
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/captcha_overlay.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.memory(
                bytes,
                width: 120, // Adjust size as needed
                height: Responsive.height(6.90, context),
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Text(
                    'Error loading CAPTCHA',
                    style: TextStyle(color: Colors.red),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
    }
}
