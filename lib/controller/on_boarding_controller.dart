import 'package:adcda_volunteers_mobile/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs;

  bool get isLastPage => selectedPageIndex.value == onBoardingList.length - 1;
  var pageController = PageController();

  @override
  void onInit() {
    getOnBoardingData();
    super.onInit();
  }

  RxBool isLoading = true.obs;
  RxList<OnBoardingModel> onBoardingList = <OnBoardingModel>[].obs;

  getOnBoardingData() async {
    List<OnBoardingModel> onboardingData = [
      OnBoardingModel(
        id: "1",
        image: "assets/images/svg/logo.svg", // Path to your illustration
        title: "Welcome",
        subTitle: "",
        description: "",
      ),
      OnBoardingModel(
        id: "2",
        image: "assets/images/onboarding/tap1.svg", // Path to your illustration
        title: "Join ADCDA Volunteers".tr,
        subTitle: "",
        description:
            "Be a vital part of our emergency response network. As an ADCDA volunteer, you'll help protect lives and support your community when it matters most."
                .tr,
      ),
      OnBoardingModel(
        id: "3",
        image: "assets/images/onboarding/tap2.svg", // Path to your illustration
        title: "ADCDA Fire Volunteers",
        subTitle: "",
        description:
            "Become part of Abu Dhabi's emergency response team. As a firefighting volunteer, you'll be trained to assist professional firefighters and help protect our community during critical situations.",
      ),
      OnBoardingModel(
        id: "3",
        image: "assets/images/onboarding/tap3.svg", // Path to your illustration
        title: "Road Emergency Response",
        subTitle: "",
        description:
            "Join ADCDA's specialized team of volunteers trained to assist at road incidents. Your quick action and support can make a critical difference in the crucial moments following an accident.",
      ),
    ];
    onBoardingList.addAll(onboardingData);
    isLoading.value = false;
    update();
  }
}
