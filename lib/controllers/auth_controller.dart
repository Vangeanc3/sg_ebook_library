import 'package:asyncstate/mixin/asyncstate_mixing.dart';
import 'package:eetepa_app_frontend/src/models/user.dart';
import 'package:eetepa_app_frontend/src/services/auth_service.dart';
import 'package:eetepa_app_frontend/src/services/register_service.dart';
import 'package:flutter/widgets.dart';

class AuthController with AsyncStateMixin {
  final authService = AuthService();

  Future<String?> signUp(User user, BuildContext context) async {
    final registerService = RegisterService();
    return await callAsyncLoader(registerService.register(user, context));
  }

  Future<String?> signIn(String email, String senha) async {
    return await callAsyncLoader(authService.signIn(email, senha));
  }

  Future<String?> signOut() async {
    return await callAsyncLoader(authService.signOut());
  }

  Future<String?> resetPassword({required String email}) async {
    return await callAsyncLoader(authService.resetPassword(email));
  }

  Future<String?> deleteAccount() async {
    return await authService.deleteAccount();
  }
}
