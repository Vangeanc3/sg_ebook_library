import 'package:grimorio/models/user.dart';
import 'package:grimorio/services/user_service.dart';

class UserController {
  final userService = UserService();

  Future<void> createUser({required User user}) async {
    return await userService.createUser(user: user);
  }

  Future<User?> getUser(String uid) async {
    return await userService.getUser(uid);
  }

  updateUser() {}

  deleteUser() {}
}
