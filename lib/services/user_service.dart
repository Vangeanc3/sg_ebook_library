import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grimorio/models/user.dart';

class UserService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createUser({required User user}) async {
    await firestore.collection('Users').doc(user.id).set(user.toMap());
  }

  Future<List<User>> getUsers() async {
    List<User> temp = [];

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('Users').get();

    for (var doc in snapshot.docs) {
      temp.add(User.fromMap(doc.data()));
    }

    return temp;
  }

  Future<User?> getUser(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('Users').doc(uid).get();

    if (snapshot.data() != null) {
      User user = User.fromMap(snapshot.data()!);
      return user;
    }

    return null;
  }

  updateUser() {}

  deleteUser() {}
}
