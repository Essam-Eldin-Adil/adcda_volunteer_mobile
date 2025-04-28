import 'package:adcda_volunteers_mobile/controller/on_boarding_controller.dart';
import 'package:adcda_volunteers_mobile/core/constants/colors.dart';
import 'package:adcda_volunteers_mobile/core/constants/constant.dart';
import 'package:adcda_volunteers_mobile/core/utils/Preferences.dart';
import 'package:adcda_volunteers_mobile/widgets/app_header.dart';
import 'package:adcda_volunteers_mobile/widgets/app_logo.dart';
import 'package:adcda_volunteers_mobile/widgets/cover_image.dart';
import 'package:adcda_volunteers_mobile/widgets/language_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<OnBoardingController>(
      init: OnBoardingController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body:
              controller.isLoading.value
                  ? Constant.loader()
                  : Stack(
                    children: [
                      CoverImage(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          appHeader(context),
                          SizedBox(height: 10),
                          Expanded(
                            flex: 0,
                            child: Align(
                              alignment: Alignment.centerRight,

                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: LanguageSwitchButton(),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                            flex: 3,
                            child: PageView.builder(
                              controller: controller.pageController,
                              onPageChanged: controller.selectedPageIndex.call,
                              itemCount: controller.onBoardingList.length,
                              itemBuilder: (context, index) {
                                return index == 0
                                    ? Column(
                                      children: [
                                        const SizedBox(height: 90),
                                        Text(
                                          controller
                                              .onBoardingList[index]
                                              .title!
                                              .tr,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 50),
                                        appLogoLg(context),
                                        const SizedBox(height: 10),
                                        controller
                                                    .onBoardingList[index]
                                                    .description !=
                                                null
                                            ? Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 20.0,
                                                    ),
                                                child: Text(
                                                  controller
                                                      .onBoardingList[index]
                                                      .description!
                                                      .tr,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            )
                                            : SizedBox(),
                                      ],
                                    )
                                    : Column(
                                      children: [
                                        const SizedBox(height: 90),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 40,
                                          ),
                                          child: SvgPicture.asset(
                                            controller
                                                .onBoardingList[index]
                                                .image!,
                                          ),
                                        ),
                                        //const SizedBox(height: 10),
                                        Column(
                                          children: [
                                            Text(
                                              controller
                                                  .onBoardingList[index]
                                                  .title!
                                                  .tr,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 40.0,
                                                  ),
                                              child: Text(
                                                controller
                                                    .onBoardingList[index]
                                                    .description!
                                                    .tr,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: Color(0xFFC7C7C6),
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                              },
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      controller.onBoardingList.length,
                                      (index) => Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 4,
                                        ),
                                        width:
                                            controller
                                                        .selectedPageIndex
                                                        .value ==
                                                    index
                                                ? 30
                                                : 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color:
                                              controller
                                                          .selectedPageIndex
                                                          .value ==
                                                      index
                                                  ? AppColors.primary
                                                  : const Color(0xffD4D5E0),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      if (controller.selectedPageIndex.value ==
                                          3) {
                                        Preferences.setBoolean(
                                          Preferences.isFinishOnBoardingKey,
                                          true,
                                        );
                                        // Get.offAll(WelcomeScreen());
                                      } else {
                                        controller.pageController.animateToPage(
                                          controller.selectedPageIndex.value +
                                              1,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.easeInOut,
                                        );
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          controller.selectedPageIndex.value ==
                                                  3
                                              ? 'Get started'.tr
                                              : 'Next'.tr,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(width: 3),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
        );
      },
    );
  }
}
