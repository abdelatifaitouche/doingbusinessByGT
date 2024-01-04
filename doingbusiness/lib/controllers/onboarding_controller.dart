import 'package:doingbusiness/intro_screens/intro_screen.dart';
import 'package:doingbusiness/main_screen.dart';
import 'package:doingbusiness/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingController extends GetxController {
  PageController pageviewController = PageController();

  final pages = [
    IntroScreen(
      model: OnBoardingModel(
          title: "Restez à la pointe de l’actualité financière",
          subTitle:
              'Restez informé sur les dernières tendances financières. Parcourez nos articles pour découvrir les opportunités émergentes.',
          textColor: Colors.white,
          bgColor: const Color(0XFF4f2d7f),
          image: "assets/images/intro01.png"),
    ),
    IntroScreen(
      model: OnBoardingModel(
          title: "Accédez à une mine d'informations financières",
          subTitle:
              'Consultez notre documentation détaillée pour comprendre tous les aspects de la gestion financière.',
          textColor: Colors.white,
          bgColor: const Color(0XFF4f2d7f),
          image: "assets/images/intro02.png"),
    ),
    IntroScreen(
      model: OnBoardingModel(
          title: "Boostez vos connaissances financières",
          subTitle:
              'Découvrez nos articles percutants et affinez votre expertise.',
          textColor: Colors.white,
          bgColor: Colors.white,
          image: "assets/images/intro03.png"),
    ),
  ];

  //function to skip to mainScreen and set the onBoarding to true
  skip() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingShown', true);
    Get.offAll(const MainScreen());
  }
}
