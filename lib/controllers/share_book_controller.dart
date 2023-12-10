import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grimorio/models/personal_book.dart';
import 'package:uuid/uuid.dart';

class ShareBookController {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addSharedBook(String userId, PersonalBook personalBook) async {
    firestore
        .collection('Users')
        .doc(userId)
        .collection('Books')
        .doc(const Uuid().v1())
        .set(personalBook.toMap());
  }

  Future<List<PersonalBook>> getSharedBooks() async {
    List<PersonalBook> temp = [];

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('Users').doc(uid).collection('Books').get();

    for (var doc in snapshot.docs) {
      temp.add(PersonalBook.fromMap(doc.data()));
    }

    return temp;
  }
}
