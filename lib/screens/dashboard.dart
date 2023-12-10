import 'package:flutter/material.dart';
import 'package:grimorio/screens/components/button.dart';
import 'package:grimorio/screens/login.dart';
import 'package:grimorio/theme.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: AppBackgroundProperties.boxDecoration,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Image(image: AssetImage('assets/images/livro.jpeg')),
                    const Text('SG Biblioteca',
                        style: TextStyle(color: Colors.black, fontSize: 30)),
                    const Expanded(child: SizedBox()),
                    Button(
                      text: 'Entrar',
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ));
                      },
                      cor: Colors.green,
                    ),
                    const SizedBox(height: 32)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
