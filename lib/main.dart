import 'package:asyncstate/class/async_class.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grimorio/firebase_options.dart';
import 'package:grimorio/repositories/user_repository.dart';
import 'package:grimorio/screens/components/my_loading.dart';
import 'package:grimorio/screens/dashboard.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AsyncState.setLoaderPersonalized(
    defaultLoaderWidget: const MyLoading(),
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserRepository(),
    )
  ], child: const Grimorio()));
}

class Grimorio extends StatelessWidget {
  const Grimorio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Grimório",
      theme: ThemeData.light(useMaterial3: true),
      home: const Dashboard(),
    );
  }
}
