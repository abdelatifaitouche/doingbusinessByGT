import 'package:doingbusiness/login_screen.dart';
import 'package:doingbusiness/views/pages/page_controler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const MyNavigationBar();
              } else {
                return const LoginScreen();
              }
            }));
  }
}
