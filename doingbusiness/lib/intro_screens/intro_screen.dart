import 'package:flutter/material.dart';
import 'package:doingbusiness/models/onboarding_model.dart';

class IntroScreen extends StatelessWidget {
  final OnBoardingModel model;
  const IntroScreen({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/pbg.png"), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Image(
                  image: AssetImage(model.image),
                  height: size * 0.5,
                ),
                Column(
                  children: [
                    Text(
                      model.title,
                      style: TextStyle(
                          height: 0.9,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: model.textColor),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      model.subTitle,
                      style: TextStyle(fontSize: 18, color: model.textColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
