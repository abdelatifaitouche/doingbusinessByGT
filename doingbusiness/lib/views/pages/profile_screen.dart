import 'package:doingbusiness/controllers/text_size_controller.dart';
import 'package:doingbusiness/views/pages/saved_articles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextSizeController controller = Get.put(TextSizeController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.infinity,
                height: size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                ),
              ),
            ),
            Positioned(
              child: Container(
                width: double.infinity,
                height: size.height * 0.45,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Votre Compte',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          height: 0.9,
                          fontFamily: 'GT'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          AssetImage("assets/images/logo_gt_finale.png"),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      _auth.currentUser!.displayName!.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          height: 0.9,
                          fontFamily: 'GT'),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: size.width * 0.15,
              child: Container(
                width: size.width * 0.7,
                height: size.height * 0.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(121, 128, 108, 142),
                          spreadRadius: 8,
                          blurRadius: 30,
                          offset: const Offset(5, 15))
                    ],
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: size.height * 0.09,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: lightPurple,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.08 * 0.18,
                              horizontal: 8,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.person_2_outlined,
                                    color: Colors.white),
                                SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    _auth.currentUser!.displayName.toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        height: 0.9,
                                        fontFamily: 'GT'),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: size.height * 0.09,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: lightPurple,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.08 * 0.25,
                              horizontal: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "email",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      height: 0.9,
                                      fontFamily: 'GT'),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    _auth.currentUser!.email.toString(),
                                    overflow: TextOverflow.fade,
                                    maxLines: 2,
                                    softWrap: false,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            Color.fromARGB(255, 225, 222, 222),
                                        fontWeight: FontWeight.normal,
                                        height: 0.9,
                                        fontFamily: 'GT'),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: size.height * 0.09,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: lightPurple,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.08 * 0.25,
                              horizontal: 8,
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(SavedArticles());
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.bookmark_added_outlined,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Articles Enregistré",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.normal,
                                          height: 0.9,
                                          fontFamily: 'GT'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        InkWell(
                          onTap: () {
                            _auth.signOut();
                          },
                          child: Container(
                            height: size.height * 0.08,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primaryColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.08 * 0.35,
                              ),
                              child: Text(
                                "Sign-Out",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    height: 0.9,
                                    fontFamily: 'GT'),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
