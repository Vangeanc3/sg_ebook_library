import 'package:grimorio/models/user.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:grimorio/controllers/user_controller.dart';

class UserRepository extends ChangeNotifier {
  model.User? _user;

  model.User? get user => _user;

  UserRepository() {
    initializeUser();
  }

  Future<void> initializeUser() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      _user = await UserController().getUser(currentUser.uid);

      notifyListeners();
    }
  }

  setUser(model.User user) {
    _user = user;
    notifyListeners();
  }
}
