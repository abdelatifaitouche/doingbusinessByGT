import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  late String imgUrl;
  late String title;
  late String blog;
  Article({required this.imgUrl, required this.title, required this.blog});

  Article.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    imgUrl = documentSnapshot['image'];
    title = documentSnapshot["title"];
    blog = documentSnapshot["blog"];
  }
}
