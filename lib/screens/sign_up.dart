import 'package:flutter/material.dart';
import 'package:grimorio/controllers/auth_controller.dart';
import 'package:grimorio/models/user.dart';
import 'package:grimorio/screens/components/button.dart';
import 'package:grimorio/screens/components/show_snack_bar.dart';
import 'package:grimorio/screens/home.dart';
import 'package:grimorio/theme.dart';
import 'package:uuid/uuid.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final authController = AuthController();
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  register() {
    final user = User(
      id: const Uuid().v1(),
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    authController.signUp(user, context).then((String? error) {
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
          title: const Text('Cadastre-se'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
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
                                return "Insira um nome válido.";
                              }
                              return null;
                            },
                            controller: nameController,
                            style: InputDecorationProperties.textDecoration,
                            decoration:
                                InputDecorationProperties.newInputDecoration(
                                    "Seu nome aqui", "Nome"),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.length < 4) {
                                return "Insira um e-mail válido.";
                              }
                              return null;
                            },
                            controller: emailController,
                            style: InputDecorationProperties.textDecoration,
                            decoration:
                                InputDecorationProperties.newInputDecoration(
                                    "seuemail@dominio.com", "E-mail"),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.length < 4) {
                                return "Insira uma senha válida.";
                              }
                              return null;
                            },
                            controller: passwordController,
                            style: InputDecorationProperties.textDecoration,
                            decoration:
                                InputDecorationProperties.newInputDecoration(
                                    "******", "Senha"),
                            obscureText: true,
                          ),
                        ),
                        Button(
                          text: "Cadastrar",
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              register();
                            }
                          },
                          cor: Colors.green,
                          corTexto: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              fixedSize: const Size.fromWidth(246),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Fazer login",
                              style: TextStyle(
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
