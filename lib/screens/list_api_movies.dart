import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'package:movil2025/models/api_movie.dart';
import 'package:movil2025/services/api_movies.dart';
import 'package:movil2025/widgets/item_movie_widget.dart';

class ListApiMovies extends StatefulWidget {
  const ListApiMovies({super.key});

  @override
  State<ListApiMovies> createState() => _ListApiMoviesState();
}

class _ListApiMoviesState extends State<ListApiMovies> {
  ApiMovies apiMovies = ApiMovies();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ApiMovies')),
      body: FutureBuilder(
        future: apiMovies.getMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CustomScrollView(
              slivers: [
                SliverGrid.builder(
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .7,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return ItemMovieWidget(apiMovieDao: snapshot.data![index]);
                  },
                  ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Ocurrio un error'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}