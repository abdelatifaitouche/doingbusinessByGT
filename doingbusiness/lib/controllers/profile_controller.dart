import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference db = FirebaseFirestore.instance.collection("users");

  // get the user
  Future<void> getUser() async {
    final user = await _auth.currentUser;
    Query query = db.where("email", isEqualTo: user!.email);
    QuerySnapshot querySnapshot = await query.get();
    final _docData = querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}
