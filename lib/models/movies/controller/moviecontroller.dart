import 'package:mobile_movies/models/movies/services/movie_service.dart';

class MovieController{
  final MovieService _movieService;

  MovieController( MovieService movieService) : _movieService=movieService;

  Future<List> getMovies() async{
    return await _movieService.getMovies();
  }
}