import 'package:flutter/widgets.dart';
import 'package:grimorio/models/user.dart';
import 'package:grimorio/services/auth_service.dart';

class AuthController {
  final authService = AuthService();

  Future<String?> signUp(User user, BuildContext context) async {
    return await authService.signUp(user, context);
  }

  Future<String?> signIn(String email, String senha) async {
    return await authService.signIn(email, senha);
  }

  Future<String?> signOut() async {
    return await authService.signOut();
  }

  Future<String?> resetPassword({required String email}) async {
    return await authService.resetPassword(email);
  }

  Future<String?> deleteAccount() async {
    return await authService.deleteAccount();
  }
}
