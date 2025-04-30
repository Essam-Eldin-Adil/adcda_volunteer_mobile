import 'package:adcda_volunteers_mobile/core/theme/responsive.dart';
import 'package:adcda_volunteers_mobile/widgets/app_header.dart';
import 'package:adcda_volunteers_mobile/widgets/app_logo.dart';
import 'package:adcda_volunteers_mobile/widgets/card_widget.dart';
import 'package:adcda_volunteers_mobile/widgets/cover_image.dart';
import 'package:adcda_volunteers_mobile/widgets/language_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          CoverImage(),
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appHeader(context),
                  SizedBox(height: Responsive.height(1.05, context)),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LanguageSwitchButton(),
                        appLogo(context, width: 27.50),
                      ],
                    ),
                  ),
                  SizedBox(height: Responsive.height(1.05, context)),
                  Text(
                    'Welcome, Essam'.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: Responsive.height(2.0, context)),
                  CardWidget(cardHolderName: 'Essam'),
                  SizedBox(height: Responsive.height(4.39, context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
