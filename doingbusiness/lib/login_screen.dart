import 'package:doingbusiness/constants.dart';
import 'package:doingbusiness/controllers/login_controller.dart';
import 'package:doingbusiness/signup_screen.dart';
import 'package:doingbusiness/views/pages/password_reset_screen.dart';
import 'package:doingbusiness/widgets/text_form_global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo_gt_finale.png',
                  fit: BoxFit.cover,
                  height: 100,
                ),
                const SizedBox(height: 40),
                const Text('Connectez vous a DoingBusiness',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        height: 0.9,
                        fontFamily: 'GT')),
                const SizedBox(height: 80),
                TextFormGlobal(
                  controller: controller.emailcontroller,
                  text: 'email',
                  obscureText: false,
                  icon: Icon(Icons.email_outlined),
                ),
                const SizedBox(height: 20),
                TextFormGlobal(
                  controller: controller.passwordcontroller,
                  text: 'password',
                  obscureText: true,
                  icon: Icon(Icons.fingerprint_outlined),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(PasswordResetScreen());
                      },
                      child: Text(
                        'Mot de passe oublié ?',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 0.9,
                            fontFamily: 'GT'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(5),
                      backgroundColor: primaryColor,
                    ),
                    onPressed: controller.signIn,
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      "Vous n'avez pas de compte? ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          height: 0.9,
                          fontFamily: 'GT'),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(SignUpScreen());
                      },
                      child: Text(
                        'Créer un !',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 0.9,
                            fontFamily: 'GT'),
                      ),
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
