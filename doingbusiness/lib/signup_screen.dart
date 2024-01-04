import 'package:doingbusiness/constants.dart';
import 'package:doingbusiness/controllers/signup_controller.dart';
import 'package:doingbusiness/login_screen.dart';
import 'package:doingbusiness/widgets/text_form_global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_gt_finale.png',
                  fit: BoxFit.cover,
                  height: 100,
                ),
                const SizedBox(height: 20),
                const Text('Créer votre compte rapidement',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        height: 0.9,
                        fontFamily: 'GT')),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormGlobal(
                      controller: controller.name,
                      text: 'Nom',
                      obscureText: false,
                      width: size.width * 0.38,
                      icon: Icon(Icons.person_outlined),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextFormGlobal(
                      controller: controller.prenom,
                      text: 'Prénom',
                      obscureText: false,
                      width: size.width * 0.38,
                      icon: Icon(Icons.person),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormGlobal(
                  controller: controller.emailcontroller,
                  text: 'E-mail',
                  obscureText: false,
                  icon: Icon(Icons.mail_outline_outlined),
                ),
                const SizedBox(height: 20),
                TextFormGlobal(
                  controller: controller.passwordcontroller,
                  text: 'password',
                  obscureText: true,
                  icon: Icon(Icons.fingerprint_outlined),
                ),
                const SizedBox(height: 10),
                TextFormGlobal(
                  controller: controller.passwordConfirmController,
                  text: 'confirm password',
                  obscureText: true,
                  icon: Icon(Icons.fingerprint_outlined),
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
                    onPressed: controller.signUp,
                    child: const Text(
                      'Créer votre compte',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vous avez deja un compte? ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          height: 0.9,
                          fontFamily: 'GT'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(LoginScreen());
                      },
                      child: Text(
                        'Connectez vous!',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
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
