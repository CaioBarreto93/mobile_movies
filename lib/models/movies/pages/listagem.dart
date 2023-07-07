import 'package:flutter/material.dart';
import 'package:mobile_movies/models/movies/controller/moviecontroller.dart';
import 'package:mobile_movies/routes/routes_generator.dart';
import 'package:mobile_movies/shared/constants.dart';

import '../../../components/toprated.dart';
import '../../../shared/text.dart';

class ListagemPage extends StatelessWidget {
  final MovieController _movieController;
  const ListagemPage({required MovieController movieController, super.key})
      : _movieController = movieController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIsfRHWK-qgWcDUmNzW46t6qK45SF1hRsEVw&usqp=CAU'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SizedBox.shrink(),
            ),
            ListTile(
              leading: const Icon(Icons.burst_mode_outlined),
              title: const Text(AppConstants.listagemFilmes),
              onTap: () {
                Navigator.of(context).pushNamed(RoutesGenerator.listagemPage);
              },
            ),
            ListTile(
              leading: const Icon(Icons.tv),
              title: const Text(AppConstants.listagemTV),
              onTap: () {
                Navigator.of(context).pushNamed(RoutesGenerator.listagemTVPage);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const modified_text(
          text: 'Mobile Movies App',
          color: Colors.blue,
        ),
        backgroundColor: Colors.grey,
      ),
      body: FutureBuilder(
        future: _movieController.getMovies(),
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
            child: TopRatedMovies(toprated: snapshot.data as List),
          );
        }),
      ),
    );
  }
}
