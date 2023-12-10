import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grimorio/colors_schemes.dart';
import 'package:grimorio/controllers/auth_controller.dart';
import 'package:grimorio/screens/components/show_snack_bar.dart';
import 'package:grimorio/screens/dashboard.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    callSignOut() async {
      final authController = AuthController();
      authController.signOut().then((String? error) {
        if (error != null) {
          showSnackBar(context: context, message: error, isError: true);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const Dashboard(),
              ),
              (route) => false);
        }
      });
    }

    return Drawer(
      backgroundColor: ColorsSchemes.darkColorScheme.background,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: const Icon(Icons.account_circle, size: 50),
            accountName: Text(user?.displayName ?? 'Desconhecido'),
            accountEmail: Text(user?.email ?? 'teste'),
            arrowColor: Colors.red,
          ),
          const Expanded(
            child: SizedBox(),
          ),
          ListTile(
            iconColor: ColorsSchemes.lightColorScheme.background,
            textColor: ColorsSchemes.lightColorScheme.background,
            leading: const Icon(
              Icons.logout,
              size: 30,
            ),
            title: const Text("Desconectar usuário",
                style: TextStyle(fontSize: 18)),
            onTap: () => callSignOut(),
          ),
        ],
      ),
    );
  }
}
