import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grimorio/models/user.dart';

class UserService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createUser({required User user}) async {
    await firestore.collection('Users').doc(user.id).set(user.toMap());
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
