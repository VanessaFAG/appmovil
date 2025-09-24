import 'package:flutter/material.dart';
import 'package:movil2025/database/movies_database.dart';

class ListMovies extends StatefulWidget {
  const ListMovies({super.key});

  @override
  State<ListMovies> createState() => _ListMoviesState();
}

class _ListMoviesState extends State<ListMovies> {
  MoviesDatabase? moviesDB;

  void initSate() {
    super.initState();
    moviesDB = MoviesDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de peliculas ඞ")),
      body: FutureBuilder(
        future: moviesDB?.SELECT(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Algo esta mal"));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final objM = snapshot.data![index];
                return Container(
                  height: 100,
                  color: Colors.black,
                  child: Text(objM.movie!),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
