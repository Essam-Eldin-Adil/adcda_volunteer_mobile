import 'package:adcda_volunteers_mobile/core/constants/colors.dart';
import 'package:adcda_volunteers_mobile/widgets/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LanguageSwitchButton extends StatefulWidget {
  const LanguageSwitchButton({super.key});

  @override
  State<LanguageSwitchButton> createState() => _LanguageSwitchButtonState();
}

class _LanguageSwitchButtonState extends State<LanguageSwitchButton> {
  void _changeLanguage(String languageCode, String countryCode) async {
    Get.updateLocale(Locale(languageCode, countryCode));
  }

  List<bool> isSelected = [false, false];
  late int languageIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      languageIndex = getLanguageIndex();
    });
  }

  int getLanguageIndex() {
    if (Get.locale?.languageCode == 'en') {
      languageIndex = 0;
    } else if (Get.locale?.languageCode == 'ar') {
      languageIndex = 1;
    } else {
      languageIndex = 0; // Default to English if no match
    }
    return languageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ToggleSwitch(
        textDirectionRTL: true, //languageIndex == 1 ? true : false,
        centerText: true,
        radiusStyle: true,
        minWidth: 25,
        minHeight: 20,
        fontSize: 8,
        animate: true,
        animationDuration: 400,
        initialLabelIndex: languageIndex,
        cornerRadius: 5.0,
        activeBgColor: [AppColors.primaryDark],
        inactiveBgColor: Colors.white,
        borderColor: [Colors.white, Colors.white],
        customTextStyles: [
          TextStyle(
            fontSize: 12,
            color: languageIndex == 1 ? AppColors.primaryDark : Colors.white,
            fontWeight: FontWeight.w600,
          ),
          TextStyle(
            fontSize: 12,
            color: languageIndex == 0 ? AppColors.primaryDark : Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ],
        totalSwitches: 2,
        labels: ['E', 'ع'],

        onToggle: (index) {
          showAlertDialog(
            context: context,
            title: 'title',
            message: 'message',
            okButtonText: 'Ok',
            cancelButtonText: 'Cancel',
            onOk: () {
              setState(() {
                languageIndex = index!;
                var newLocale = index == 0 ? 'en' : 'ar';
                var countryCode = index == 0 ? 'US' : 'AE';
                _changeLanguage(newLocale, countryCode);
              });
            },
          );
        },
      ),
    );
  }
}
