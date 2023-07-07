import 'package:flutter/material.dart';

import '../../../components/input_default.dart';
import '../../../routes/routes_generator.dart';
import '../../../shared/validators.dart';

class NovaSenhaPage extends StatefulWidget {
  const NovaSenhaPage({Key? key}) : super(key: key);

  @override
  _NovaSenhaPageState createState() => _NovaSenhaPageState();
}

class _NovaSenhaPageState extends State<NovaSenhaPage> {
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

  void _cadastrar() {
    if (_formKey.currentState!.validate()) {
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
        title: const Text('Cadatro Nova Senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InputDefault(
                hintText: "Informe sua nova Senha",
                keyboardType: TextInputType.text,
                onChanged: (value) {},
              ),
              const SizedBox(height: 16.0),
              InputDefault(
                hintText: "Repitir nova Senha",
                keyboardType: TextInputType.text,
                onChanged: (value) {},
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.cyan)),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(RoutesGenerator.loginPage);
                },
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
