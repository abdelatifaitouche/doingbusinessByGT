import 'dart:async';
import 'package:doingbusiness/constants.dart';
import 'package:doingbusiness/login_screen.dart';
import 'package:doingbusiness/views/pages/page_controler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

class EmailVerificationScreen extends StatefulWidget {
  EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool isEmailVerified = false;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.currentUser?.sendEmailVerification();
    timer =
        Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      // TODO: implement your code after email verification
      timer?.cancel();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: isEmailVerified
              ?
              //show design for when email is verified
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 57.0),
                  child: Column(
                    children: [
                      Lottie.asset('assets/images/sucess_animation.json'),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () => {Get.offAll(MyNavigationBar())},
                          child: Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                'Explorer',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 35),
                    const SizedBox(height: 30),
                    const Center(
                      child: Text(
                        'Check your \n Email',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Center(
                        child: Text(
                          'We have sent you an Email',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Center(child: CircularProgressIndicator()),
                    const SizedBox(height: 8),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32.0),
                          child: Center(
                            child: Text(
                              'Verifying email....',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 57),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: ElevatedButton(
                            child: const Text('Resend'),
                            onPressed: () {
                              try {
                                FirebaseAuth.instance.currentUser
                                    ?.sendEmailVerification();
                              } catch (e) {
                                debugPrint('$e');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
