import 'package:doingbusiness/constants.dart';
import 'package:doingbusiness/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());
      Get.snackbar(
        'E-mail envoyer',
        'Verifiez votre adresse e-mail',
        colorText: Colors.white,
        backgroundColor: greenColor,
        icon: const Icon(Icons.add_alert),
      );
      Get.offAll(LoginScreen());
    } catch (e) {
      Get.snackbar(
        'Erreur',
        'Verifiez vos informations',
        colorText: Colors.white,
        backgroundColor: redColor,
        icon: const Icon(
          Icons.error_outline_outlined,
          color: Colors.white,
        ),
      );
    }
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim());
      Get.offAll(PageController());
      Get.snackbar(
        'Bienvenu',
        'sur DoingBusiness',
        colorText: Colors.white,
        backgroundColor: greenColor,
        icon: const Icon(Icons.add_alert),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        Get.snackbar(
          'Erreur',
          'mot de passe erroné',
          colorText: Colors.white,
          backgroundColor: redColor,
          icon: const Icon(
            Icons.error_outline_outlined,
            color: Colors.white,
          ),
        );
      } else if (e.code == "user-not-found") {
        Get.snackbar(
          'Erreur',
          'Utilisateur introuvable',
          colorText: Colors.white,
          backgroundColor: redColor,
          icon: const Icon(
            Icons.error_outline_outlined,
            color: Colors.white,
          ),
        );
      }
      return;
    }
  }
}
