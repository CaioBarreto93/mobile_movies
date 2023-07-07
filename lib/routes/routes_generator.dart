import 'package:flutter/material.dart';
import 'package:mobile_movies/models/movies/controller/moviecontroller.dart';
import 'package:mobile_movies/models/movies/datasources/movie_datasource_impl.dart';
import 'package:mobile_movies/models/movies/pages/listagem.dart';
import 'package:mobile_movies/models/movies/services/movie_service.dart';

import '../models/login/pages/login.dart';
import '../shared/constants.dart';

class RoutesGenerator {
  static const loginPage = '/';
  static const listagemPage = '/listagem';

  RoutesGenerator._();

  static Route generate(RouteSettings settings) {
    final movieDatasource = MovieDatasourceImpl();
    final movieService = MovieService(movieDatasource);
    final movieController = MovieController(movieService);

    switch (settings.name) {
      case loginPage:
        return _goPage(const LoginPage());
      case listagemPage:
        return _goPage(ListagemPage(movieController: movieController));
      default:
        throw const FormatException(AppConstants.pageNotFound);
    }
  }

  static _goPage(Widget page) => MaterialPageRoute(
        builder: (_) => page,
      );
}
