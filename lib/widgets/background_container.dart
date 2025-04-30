import 'package:adcda_volunteers_mobile/core/theme/responsive.dart';
import 'package:adcda_volunteers_mobile/widgets/app_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({super.key, required this.child, this.darkBackground = false, this.isLoading=false, this.loadingText});
final Widget child;
final bool? isLoading;
final String? loadingText;
final bool? darkBackground;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
             darkBackground ?? false
          ? "assets/images/bg_container-200.jpg"
          : "assets/images/bg_cover_container.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: isLoading??false?
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoadingAnimationWidget.staggeredDotsWave(
            size: 40, color: Colors.white,
                  ),
                  Text(loadingText??'Loading...'.tr, style: TextStyle(color: Colors.white),),
          ],
        ):
        Container(
          color: Colors.black.withOpacity(0.5), // Overlay for readability
          child: Stack(
            clipBehavior: Clip.none,
            children: [
             
              Positioned(
                top: 100, // Match fixed items' height to start content below
              left: 0,
              right: 0,
              bottom: 0,
                child: ClipRect(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: Responsive.height(2, context)),
                  child: child,
                  
                              ),
                ),
              ),
             Positioned(child: appHeader(context),),
             ]
          ),
        ),
      );
  }
}