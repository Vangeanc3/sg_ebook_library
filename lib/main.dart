import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grimorio/firebase_options.dart';
import 'package:grimorio/repositories/user_repository.dart';
import 'package:grimorio/screens/dashboard.dart';
import 'package:grimorio/screens/home.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  bool isLogged = verifyLogged();

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserRepository(),
        )
      ],
      child: (Grimorio(
        isLogged: isLogged,
      ))));
}

class Grimorio extends StatelessWidget {
  final bool isLogged;
  const Grimorio({super.key, required this.isLogged});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SG Biblioteca",
      theme: ThemeData.light(useMaterial3: true),
      home: (isLogged) ? const Home() : const Dashboard(),
    );
  }
}

bool verifyLogged() {
  User? currentUser = FirebaseAuth.instance.currentUser;

  if (currentUser == null) {
    return false;
  }
  return true;
}
