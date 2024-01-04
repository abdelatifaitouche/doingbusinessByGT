import 'package:doingbusiness/constants.dart';
import 'package:doingbusiness/controllers/login_controller.dart';
import 'package:doingbusiness/widgets/text_form_global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PasswordResetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset('assets/images/loading_animation.json'),
              const Text('Reinitialiser votre mot de passe',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      height: 0.9,
                      fontFamily: 'GT')),
              SizedBox(
                height: 30,
              ),
              TextFormGlobal(
                controller: controller.emailcontroller,
                text: 'E-mail',
                obscureText: false,
                icon: Icon(Icons.email_outlined),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(5),
                    backgroundColor: primaryColor,
                  ),
                  onPressed: controller.resetPassword,
                  child: const Text(
                    'Reset',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
