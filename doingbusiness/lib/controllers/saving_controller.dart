import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SavingController extends GetxController {
  RxBool liked = false.obs;
  List savedArticles = [];

  void saveArticle(DocumentSnapshot article) {
    //if there is an article storage , load it
    //else create it
    final box = GetStorage();
    savedArticles = box.read('Articles');

    //get the article ID
    String articleTitre = article['titre'];
    String articleBody = article['blog'];

    //save it to the storage in a list
    savedArticles.add({'titre': articleTitre, 'body': articleBody});

    box.write('Articles', savedArticles);
    //change the button background
    liked.value = false;
  }
}
