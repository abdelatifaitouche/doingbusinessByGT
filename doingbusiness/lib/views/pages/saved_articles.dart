import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doingbusiness/constants.dart';
import 'package:doingbusiness/models/article.dart';
import 'package:doingbusiness/views/pages/article_details.dart';
import 'package:doingbusiness/views/pages/article_hors_connexion.dart';
import 'package:doingbusiness/views/widgets/latest_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SavedArticles extends StatefulWidget {
  @override
  State<SavedArticles> createState() => _SavedArticlesState();
}

class _SavedArticlesState extends State<SavedArticles> {
  List savedArticles = [];

  loadSavedArticles() {
    final box = GetStorage();
    if (box.hasData("Articles")) {
      savedArticles = box.read('Articles');
    } else {
      return;
    }

    // the goal is to grab each article by ID
  }

  void deleteItem(int index) {
    final box = GetStorage();
    savedArticles = box.read('Articles');
    savedArticles.removeAt(index);
    box.write('Articles', savedArticles);
  }

  void initState() {
    super.initState();
    loadSavedArticles();
  }

  Widget build(BuildContext) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
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
                    const Text('Articles Enregistré',
                        style: TextStyle(
                            fontSize: 28,
                            height: 0.9,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'GT')),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 50,
                ),
                savedArticles.length == 0
                    ? Text('nothing saved yet ...')
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: savedArticles.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(ArticleHorsConnexion(
                                article: Article(
                                    imgUrl: "assets/images/logo_gt.png",
                                    title: savedArticles[index]['titre'],
                                    blog: savedArticles[index]['body']),
                              ));
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 30,
                                    offset: Offset(-5, -5),
                                    color: Colors.white,
                                  ),
                                  BoxShadow(
                                      blurRadius: 10,
                                      offset: Offset(5, 5),
                                      color:
                                          Color.fromARGB(255, 201, 202, 206)),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.article_rounded,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          savedArticles[index]['titre'],
                                          overflow: TextOverflow.fade,
                                          style: const TextStyle(
                                              height: 0.9,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Get.dialog(
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 40),
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(20),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: Material(
                                                      child: Column(
                                                        children: [
                                                          const SizedBox(
                                                              height: 10),
                                                          const Text(
                                                            "Voulez vous supprimer cet articles ?",
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          const SizedBox(
                                                              height: 15),

                                                          //Buttons
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    ElevatedButton(
                                                                  child:
                                                                      const Text(
                                                                    'NON',
                                                                  ),
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    minimumSize:
                                                                        const Size(
                                                                            0,
                                                                            45),
                                                                    primary:
                                                                        greenColor,
                                                                    onPrimary:
                                                                        const Color(
                                                                            0xFFFFFFFF),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    Get.back(
                                                                        closeOverlays:
                                                                            true);
                                                                  },
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Expanded(
                                                                child:
                                                                    ElevatedButton(
                                                                  child:
                                                                      const Text(
                                                                    'YES',
                                                                  ),
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    minimumSize:
                                                                        const Size(
                                                                            0,
                                                                            45),
                                                                    primary:
                                                                        redColor,
                                                                    onPrimary:
                                                                        const Color(
                                                                            0xFFFFFFFF),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    deleteItem(
                                                                        index);
                                                                    Get.back(
                                                                        closeOverlays:
                                                                            true);
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                        //deleteItem(index);
                                      },
                                      child: Icon(
                                        Icons.delete_outline_rounded,
                                        color: redColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
