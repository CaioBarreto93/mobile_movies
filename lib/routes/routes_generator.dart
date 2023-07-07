import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/login/pages/cadastro.dart';
import '../models/login/pages/esquecer_senha.dart';
import '../models/login/pages/login.dart';
import '../models/login/pages/novaSenha.dart';
import '../shared/constants.dart';

class RoutesGenerator {
  static const loginPage = '/';
  static const cadastro = '/cadastro';
  static const esquecerSenha = '/esquecer_senha';
  static const novaSenha = '/novaSenha';

  RoutesGenerator._();

  static Route generate(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return _goPage(const LoginPage());
      case cadastro:
        return _goPage(const CadastroPage());
      case esquecerSenha:
        return _goPage(const EsquecerSenhaPage());
      case novaSenha:
        return _goPage(const NovaSenhaPage());

      default:
        throw const FormatException(AppConstants.pageNotFound);
    }
  }

  static _goPage(Widget page) => MaterialPageRoute(
        builder: (_) => page,
      );
}
