import 'package:doingbusiness/models/article.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleHorsConnexion extends StatelessWidget {
  Article article;
  ArticleHorsConnexion({required this.article});
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(article.title.toString(),
                          style: TextStyle(
                              fontSize: 28,
                              height: 0.9,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'GT')),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            AssetImage('assets/images/logo_gt_finale.png')),
                    Text("Grant Thornton",
                        style: TextStyle(
                            fontSize: 16,
                            height: 0.9,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'GT'))
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    article.blog,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
