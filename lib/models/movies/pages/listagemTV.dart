import 'package:flutter/material.dart';

import '../../../components/tvpopular.dart';
import '../../../shared/text.dart';
import '../controller/moviecontroller.dart';

class ListagemTVPage extends StatelessWidget {
  final MovieController _movieController;
  const ListagemTVPage({required MovieController movieController, super.key})
      : _movieController = movieController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const modified_text(
          text: 'Mobile Movies App',
          color: Colors.blue,
        ),
        backgroundColor: Colors.grey,
      ),
      body: FutureBuilder(
        future: _movieController.getTVSeries(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
                child: Text(
              'Infelizmente, não foi possível carregar a lista de Filmes!',
              style: TextStyle(
                color: Colors.red,
              ),
            ));
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: TVPopularSerie(tvpopular: snapshot.data as List),
          );
        }),
      ),
    );
  }
}
