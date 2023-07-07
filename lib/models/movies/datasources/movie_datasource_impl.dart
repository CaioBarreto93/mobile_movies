import 'package:mobile_movies/models/movies/datasources/movie_datasource.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MovieDatasourceImpl implements MovieDatasource {
  @override
  Future<List> getAll() async {
    const String apikey = 'af7a47dd2a49368c56a1adbbd3ef5cdb';
    const String readaccesstoken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZjdhNDdkZDJhNDkzNjhjNTZhMWFkYmJkM2VmNWNkYiIsInN1YiI6IjViNWEyZDZkMGUwYTI2NzQ5ZTAwMzA5YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.uetiKdXMuRiWvOM_1CqDYuB2pAoq9abOlYrktjiWr6o';
    List topratedmovies = [];

    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
      defaultLanguage: 'pt-BR',
    );

    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getUpcoming();

    topratedmovies = topratedresult['results'];

    return topratedmovies;

    throw UnimplementedError();
  }
}
