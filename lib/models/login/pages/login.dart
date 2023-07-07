import 'package:flutter/material.dart';
import 'package:mobile_movies/routes/routes_generator.dart';
import 'package:mobile_movies/shared/text.dart';
import '../../../components/input_default.dart';
import '../../../shared/validators.dart';

class LoginPage extends StatefulWidget {
  final String emailUsuario;
  final String senhaUsuario;

  const LoginPage(
      {Key? key, required this.emailUsuario, required this.senhaUsuario})
      : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

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
              const modified_text(text: 'Login', size: 38),
              const Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputDefault(
                      hintText: "Yourmail@gmail.com",
                      controller: _controllerEmail,
                      autofocus: true,
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
                      controller: _controllerPassword,
                      validator: Validator.requiredSenha,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      onChanged: (value) {
                        _password = value;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.cyan),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if ((_email == 'valido@usuario.com.br' &&
                                      _password == '123456@') ||
                                  (widget.emailUsuario ==
                                          _controllerEmail.text &&
                                      widget.senhaUsuario ==
                                          _controllerPassword.text)) {
                                _email = '';
                                _password = '';
                                _controllerPassword.clear();
                                _controllerEmail.clear();
                                Navigator.of(context)
                                    .pushNamed(RoutesGenerator.listagemPage);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Erro de autenticação"),
                                    content: const Text(
                                        "Email ou senha incorretos. Por favor, verifique as informações inseridas."),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("OK"),
                                      ),
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
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: SizedBox(
                            height: 40,
                            width: (MediaQuery.of(context).size.width / 2) - 45,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.cyan),
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RoutesGenerator.cadastro);
                              },
                              child: const Text(
                                "Cadastrar-se",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: SizedBox(
                            height: 40,
                            width: (MediaQuery.of(context).size.width / 2) - 45,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.cyan),
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RoutesGenerator.esquecerSenha);
                              },
                              child: const Text(
                                "Recuperar Senha",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
