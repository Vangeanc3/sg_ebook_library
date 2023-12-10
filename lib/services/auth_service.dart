import 'package:grimorio/models/user.dart' as my_user;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:grimorio/repositories/user_repository.dart';
import 'package:grimorio/services/user_service.dart';
import 'package:provider/provider.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  final _userService = UserService();

  Future<String?> signIn(String email, String senha) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: senha);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return 'Nenhum usuário encontrado para esse e-mail.';
        case 'wrong-password':
          return 'Senha está incorreta';
        case 'too-many-requests':
          return 'Espere um pouco para tentar novamente';
        default:
          return e.code;
      }
    }

    return null;
  }

  Future<String?> signUp(my_user.User user, BuildContext context) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      final uid = userCredential.user!.uid;
      await userCredential.user!.updateDisplayName(user.name);
      await _userService.createUser(user: user.copyWith(id: uid));
      _userService.getUser(userCredential.user!.uid).then((value) {
        if (value != null) {
          Provider.of<UserRepository>(context, listen: false).setUser(value);
        }
      });
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return 'O e-mail já está em uso';
        case 'weak-password':
          return 'Senha muito fraca.';
        default:
          return e.code;
      }
    }

    return null;
  }

  Future<String?> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        default:
          return e.code;
      }
    }

    return null;
  }

  Future<String?> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return 'E-mail não cadastrado.';
        default:
          return e.code;
      }
    }
    return null;
  }

  Future<String?> deleteAccount() async {
    try {
      await _firebaseAuth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        default:
          return e.code;
      }
    }
    return null;
  }
}
