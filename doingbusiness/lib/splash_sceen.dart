import 'package:animate_gradient/animate_gradient.dart';
import 'package:doingbusiness/constants.dart';
import 'package:doingbusiness/views/pages/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,
    );
    _controller.forward().then((value) => Get.to(const SplashController()));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimateGradient(
      primaryBegin: Alignment.topLeft,
      primaryEnd: Alignment.bottomLeft,
      secondaryBegin: Alignment.bottomLeft,
      secondaryEnd: Alignment.topRight,
      primaryColors: const [
        primaryColor,
        Colors.white,
      ],
      secondaryColors: const [
        Colors.white,
        primaryColor,
      ],
      child: Center(
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: const Image(
            image: AssetImage('assets/images/logo_gt_finale.png'),
            width: 200,
          ),
        ),
      ),
    );
  }
}
