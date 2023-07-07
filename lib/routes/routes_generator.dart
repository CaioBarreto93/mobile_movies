import 'package:flutter/material.dart';
import 'package:mobile_movies/models/movies/controller/moviecontroller.dart';
import 'package:mobile_movies/models/movies/datasources/movie_datasource_impl.dart';
import 'package:mobile_movies/models/movies/pages/listagem.dart';
import 'package:mobile_movies/models/movies/services/movie_service.dart';

import '../models/login/pages/cadastro.dart';
import '../models/login/pages/esquecer_senha.dart';
import '../models/login/pages/login.dart';
import '../models/login/pages/novaSenha.dart';
import '../models/movies/pages/listagemTV.dart';
import '../shared/constants.dart';

class RoutesGenerator {
  static const loginPage = '/';
  static const cadastro = '/cadastro';
  static const esquecerSenha = '/esquecer_senha';
  static const novaSenha = '/novaSenha';
  static const listagemPage = '/listagem';
  static const listagemTVPage = '/listagemTV';

  RoutesGenerator._();

  static Route generate(RouteSettings settings) {
    final movieDatasource = MovieDatasourceImpl();
    final movieService = MovieService(movieDatasource);
    final movieController = MovieController(movieService);

    switch (settings.name) {
      case loginPage:
        return _goPage(const LoginPage(
          emailUsuario: 'email',
          senhaUsuario: 'senha',
        ));
      case cadastro:
        return _goPage(const CadastroPage());
      case esquecerSenha:
        return _goPage(const EsquecerSenhaPage());
      case novaSenha:
        return _goPage(const NovaSenhaPage(
          nomeUsuario: 'nome',
          emailUsuario: 'email',
        ));
      case listagemPage:
        return _goPage(ListagemPage(movieController: movieController));
      case listagemTVPage:
        return _goPage(ListagemTVPage(movieController: movieController));
      default:
        throw const FormatException(AppConstants.pageNotFound);
    }
  }

  static _goPage(Widget page) => MaterialPageRoute(
        builder: (_) => page,
      );
}
