import 'package:flutter/material.dart';
import 'package:mobile_movies/models/movies/controller/moviecontroller.dart';

import '../../../components/toprated.dart';
import '../../../shared/text.dart';

class ListagemPage extends StatelessWidget {
  final MovieController _movieController;
  const ListagemPage({required MovieController movieController, super.key}): _movieController=movieController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const modified_text(text: 'Mobile Movies App', color: Colors.blue,),
          backgroundColor: Colors.grey,
        ),
        body: FutureBuilder(
          future: _movieController.getMovies(),
          builder: ((context, snapshot){
            if(snapshot.hasError){
              return const Center(
              child: Text('Infelizmente, não foi possível carregar a lista de Filmes!',
              style: TextStyle(color: Colors.red,),));
            }

            if(!snapshot.hasData){
              return const Center(child: CircularProgressIndicator(),
              );
            }

            return Center(child: TopRatedMovies(
              toprated: snapshot.data as List
            ),
            );
          }),
          ),
        );
  }
}