import 'package:flutter/material.dart';

import '../../../components/input_default.dart';
import '../../../shared/validators.dart';
import 'login.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _repetirSenhaController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _repetirSenhaController.dispose();
    super.dispose();
  }

  void _cadastrar() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        String email = _emailController.text;
        String senha = _senhaController.text;
        Navigator.push(context, MaterialPageRoute(
        builder: (context) => LoginPage(emailUsuario: email, senhaUsuario: senha)));     
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
        title: const Text('Cadastro'),
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
              InputDefault(
                hintText: "Inserir Senha",
                controller: _senhaController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira uma senha.';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                obscureText: true,
                onChanged: (value) {},
              ),
              const SizedBox(height: 16.0),
              InputDefault(
                hintText: "Repetir Senha",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, repita a senha.';
                  }
                  if (value != _senhaController.text) {
                    return 'As senhas não coincidem.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.cyan)),
                onPressed: _cadastrar,
                child: const Text(
                  "Salvar",
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
