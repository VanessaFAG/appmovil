import 'package:dio/dio.dart';
import 'package:movil2025/models/api_movie.dart';

class ApiMovies {
  final dio = Dio();
  final String URL =
      "https://api.themoviedb.org/3/movie/popular?api_key=YOUR_API_KEY&language=en-US&page=1";

  Future<List<ApiMovieDao>> getMovies() async {
    final response = await dio.get(URL);
    final res = response.data['results'] as List;
    return res.map((movie) => ApiMovieDao.fromMap(movie)).toList();
  }
}
