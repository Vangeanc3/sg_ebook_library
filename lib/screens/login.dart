import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grimorio/controllers/auth_controller.dart';
import 'package:grimorio/screens/components/button.dart';
import 'package:grimorio/screens/components/show_snack_bar.dart';
import 'package:grimorio/screens/home.dart';
import 'package:grimorio/screens/sign_up.dart';
import 'package:grimorio/theme.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final authController = AuthController();
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  login(String email, String senha) {
    authController.signIn(email, senha).then((String? error) {
      if (error != null) {
        showSnackBar(context: context, message: error, isError: true);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: AppBackgroundProperties.boxDecoration,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Login'),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 64),
                        child: Image(
                            image: AssetImage('assets/images/livro.jpeg')),
                      ),
                      SizedBox(
                        width: 246,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.length < 4) {
                                      return "Insira um e-mail válido.";
                                    }
                                    return null;
                                  },
                                  controller: userController,
                                  style:
                                      InputDecorationProperties.textDecoration,
                                  decoration: InputDecorationProperties
                                      .newInputDecoration(
                                          "seuemail@dominio.com", "E-mail"),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.length < 4) {
                                    return "Insira uma senha válida.";
                                  }
                                  return null;
                                },
                                controller: passwordController,
                                style: InputDecorationProperties.textDecoration,
                                decoration: InputDecorationProperties
                                    .newInputDecoration("******", "Senha"),
                                obscureText: true,
                              ),
                              const SizedBox(height: 16),
                              Button(
                                text: "Entrar",
                                corTexto: Colors.white,
                                cor: Colors.green,
                                function: () {
                                  if (_formKey.currentState!.validate()) {
                                    login(userController.text,
                                        passwordController.text);
                                  }
                                },
                              ),
                              const SizedBox(height: 8),
                              TextButton(
                                style: TextButton.styleFrom(
                                  fixedSize: const Size.fromWidth(246),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Signup()));
                                },
                                child: const Text(
                                  "Cadastre-se",
                                  style: TextStyle(
                                    fontSize: 15,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
