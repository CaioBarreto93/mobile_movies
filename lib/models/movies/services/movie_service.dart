import 'package:mobile_movies/models/movies/datasources/movie_datasource.dart';

class MovieService{
  final MovieDatasource _datasource;

  MovieService (MovieDatasource datasource): _datasource = datasource;

  Future<List> getMovies() async{
    return await  _datasource.getAll();
  }
}