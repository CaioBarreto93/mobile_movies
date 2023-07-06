import 'package:flutter/material.dart';

import '../../../components/input_default.dart';
import '../../../routes/routes_generator.dart';
import '../../../shared/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey<FormState>();
  String? _email;
  String? _senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            top: 80.0,
            right: 50.0,
            bottom: 10.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputDefault(
                      hintText: "Yourmail@gmail.com",
                      validator: Validator.requiredEmail,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        _email = value;
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    InputDefault(
                      hintText: "******",
                      validator: Validator.requiredSenha,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      onChanged: (value) {
                        _senha = value;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              Colors.cyan,
                            ),
                          ),
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              if (_email == 'valido@usuario.com.br' &&
                                  _senha == '123456@') {
                                Navigator.of(context).pushReplacementNamed(
                                    RoutesGenerator.listagemPage);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Erro de autenticação"),
                                    content: const Text(
                                        "Email ou Senha incorreto por favor verifique as informações inseridas"),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text("OK")),
                                    ],
                                  ),
                                );
                              }
                            }
                          },
                          child: const Text("Login"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
