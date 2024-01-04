import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ContentController extends GetxController {
  late Stream<QuerySnapshot> articleStream;
  late Stream<QuerySnapshot> savedStream;
  var firebase = FirebaseFirestore.instance;
  //Get all articles

  void getContent() async {
    articleStream = firebase.collection("Articles").snapshots();
  }
}
