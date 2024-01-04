import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doingbusiness/constants.dart';
import 'package:doingbusiness/views/pages/email_verification_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final name = TextEditingController();
  final prenom = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final passwordConfirmController = TextEditingController();

  Future signUp() async {
    if (passwordcontroller.text.trim() ==
        passwordConfirmController.text.trim()) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailcontroller.text.trim(),
                password: passwordcontroller.text.trim())
            .then((firebaseUser) {
          FirebaseFirestore.instance
              .collection("users")
              .doc(firebaseUser.user!.uid)
              .set({
            "nom": name.text.trim(),
            'prenom': prenom.text.trim(),
            'email': emailcontroller.text.trim(),
          });
          firebaseUser.user!
              .updateDisplayName(name.text.trim() + ' ' + prenom.text.trim());
        });

        Get.to(EmailVerificationScreen());
        return;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar(
            'Attention',
            'Mot de passe faible',
            colorText: Colors.white,
            backgroundColor: redColor,
            icon: const Icon(
              Icons.error_outline_outlined,
              color: Colors.white,
            ),
          );
        }
        if (e.code == 'email-already-in-use') {
          Get.snackbar(
            'Erreur',
            'Email deja Utilisé',
            colorText: Colors.white,
            backgroundColor: redColor,
            icon: const Icon(
              Icons.error_outline_outlined,
              color: Colors.white,
            ),
          );
        }
        return Null;
      }
    } else {
      Get.snackbar('Erreur', 'Mots de passe non-identique',
          colorText: Colors.white,
          backgroundColor: redColor,
          icon: const Icon(Icons.error_outline_outlined, color: Colors.white));
    }
  }
}
