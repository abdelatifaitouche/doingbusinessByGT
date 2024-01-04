import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main_screen.dart';
import '../../on_boarding_screen.dart';

class SplashController extends StatefulWidget {
  const SplashController({super.key});

  @override
  State<SplashController> createState() => _SplashControllerState();
}

class _SplashControllerState extends State<SplashController> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    // Simulating a delay for the splash screen

    // Check if onboarding screen has been shown
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isOnboardingShown = prefs.getBool('onboardingShown') ?? false;

    if (isOnboardingShown) {
      // Navigate to the main screen or home screen
      Get.offAll(const MainScreen());
    } else {
      // Navigate to the onboarding screen
      Get.offAll(OnboardingScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
    );
  }
}
