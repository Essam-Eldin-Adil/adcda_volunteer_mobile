import 'package:adcda_volunteers_mobile/core/theme/responsive.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CurvedCard extends StatelessWidget {
  const CurvedCard({super.key, required this.child, this.title});
  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        gradient: LinearGradient(
          colors: [Color(0xFF12171A), Color(0xFF5B6F80)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      height: double.infinity,
      width: double.infinity,
      child:
          title != null
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Responsive.height(2.09, context)),
                    SlideInUp(
                      delay: Duration(milliseconds: 0),
                      duration: Duration(milliseconds: 600),
                      child: Text(
                        title!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    SizedBox(height: Responsive.height(2.09, context)),
                    child,
                  ],
                ),
              )
              : child,
    );
  }
}
