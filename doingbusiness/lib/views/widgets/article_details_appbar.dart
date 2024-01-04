import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doingbusiness/constants.dart';
import 'package:doingbusiness/models/article.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ArticleDetailsAppBar extends StatefulWidget {
  final DocumentSnapshot article;

  const ArticleDetailsAppBar({super.key, required this.article});

  @override
  State<ArticleDetailsAppBar> createState() => _ArticleDetailsAppBarState();
}

class _ArticleDetailsAppBarState extends State<ArticleDetailsAppBar> {
  bool liked = false;
  List savedArticles = [];
  List savedArticlesId = [];

  saveArticle() {
    //if there is an article storage , load it
    //else create it
    final box = GetStorage();
    if (box.hasData('Articles')) {
      //AVOID REPETION ASAP
      savedArticles = box.read('Articles');
      //get the article ID
      String articleTitre = widget.article['titre'];
      String articleBody = widget.article['blog'];

      //check if the item is already in the saved
      bool isRepeated = savedArticles.any((element) {
        if (element['titre'] == articleTitre) {
          return true;
        }
        return false;
      });
      //save it to the storage in a list
      if (isRepeated == false) {
        savedArticles.add({'titre': articleTitre, 'body': articleBody});
      }

      box.write('Articles', savedArticles);
    } else {
      //get the article ID
      String articleTitre = widget.article['titre'];
      String articleBody = widget.article['blog'];

      //save it to the storage in a list
      savedArticles.add({'titre': articleTitre, 'body': articleBody});

      box.write('Articles', savedArticles);
    }

    setState(() {
      liked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement build
    return SliverAppBar(
      backgroundColor: primaryColor,
      expandedHeight: size.height * 0.4,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                widget.article['image'],
                fit: BoxFit.cover,
              ),
            ),
            const Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.06,
              left: 15,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 250,
                        child: Text(
                          widget.article['titre'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      liked
                          ? Icon(
                              Icons.bookmark_added_outlined,
                              color: Colors.white,
                              size: 40,
                            )
                          : GestureDetector(
                              onTap: saveArticle,
                              child: Icon(
                                Icons.bookmark_add_outlined,
                                color: Colors.white,
                                size: 40,
                              ),
                            )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground
        ],
      ),
      pinned: true,
      collapsedHeight: size.height * 0.1,
      bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: SizedBox(
            height: 30,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(36),
                ),
              ),
            ),
          )),
    );
  }
}
