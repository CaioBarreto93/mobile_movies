import 'package:flutter/material.dart';

import '../../../components/input_default.dart';
import '../../../routes/routes_generator.dart';
import '../../../shared/validators.dart';
import 'novaSenha.dart';

class EsquecerSenhaPage extends StatefulWidget {
  const EsquecerSenhaPage({Key? key}) : super(key: key);

  @override
  _EsquecerSenhaPageState createState() => _EsquecerSenhaPageState();
}

class _EsquecerSenhaPageState extends State<EsquecerSenhaPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _repetirSenhaController = TextEditingController();
  // String? _email;
  // String? _password;

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _repetirSenhaController.dispose();
    super.dispose();
  }

  void _esquecerSenha() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        String nome = _emailController.text;
        String email = _senhaController.text;
        Navigator.push(context, MaterialPageRoute(
        builder: (context) => NovaSenhaPage(nomeUsuario: nome, emailUsuario: email)));     
      });
      // Realize a ação de cadastro aqui, como enviar dados para um servidor ou salvar localmente.
      // Você pode acessar os valores dos campos usando _nomeController.text, _emailController.text, _senhaController.text, _repetirSenhaController.text.
      // Lembre-se de tratar as senhas corretamente antes de armazená-las ou enviá-las para um servidor seguro.
      // Exemplo: String nome = _nomeController.text;

      // Após o cadastro bem-sucedido, você pode redirecionar o usuário para a próxima tela ou exibir uma mensagem de sucesso.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('Recuperar a senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InputDefault(
                hintText: "Inserir Nome",
                controller: _nomeController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um Nome.';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                onChanged: (value) {},
              ),
              const SizedBox(height: 16.0),
              InputDefault(
                hintText: "Insira seu E-mail",
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um E-mail.';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.cyan)),
                onPressed: _esquecerSenha,
                child: const Text(
                  "Enviar",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
