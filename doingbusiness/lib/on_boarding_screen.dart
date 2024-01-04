import 'package:doingbusiness/constants.dart';
import 'package:doingbusiness/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  final OnBoardingController controller = Get.put(OnBoardingController());

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: controller.pageviewController,
          children: controller.pages,
        ),
        Container(
          alignment: const Alignment(0, 0.9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SmoothPageIndicator(
                controller: controller.pageviewController, // PageController
                count: controller.pages.length,

                effect: const WormEffect(
                    strokeWidth: 1.5,
                    dotColor: Color.fromARGB(255, 195, 136, 240),
                    activeDotColor: Color.fromARGB(255, 147, 11, 220)),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  onPressed: controller.skip,
                  child: const Text('Skip')),
            ],
          ),
        )
      ]),
    );
  }
}
