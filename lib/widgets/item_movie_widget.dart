import 'package:flutter/material.dart';
import 'package:movil2025/models/api_movie.dart';

class ItemMovieWidget extends StatelessWidget {

  ItemMovieWidget({super.key, required this.apiMovieDao});

  ApiMovieDao apiMovieDao;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: FadeInImage(
        placeholder: AssetImage('assets/loading.json'),
        image: NetworkImage('https://image.tmdb.org/t/p/w500/${apiMovieDao.posterPath}'), 
        ),
    );
  }
}