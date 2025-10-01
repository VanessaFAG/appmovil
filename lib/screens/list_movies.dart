import 'package:flutter/material.dart';
import 'package:movil2025/database/movies_database.dart';

class ListMovies extends StatefulWidget {
  const ListMovies({super.key});

  @override
  State<ListMovies> createState() => _ListMoviesState();
}

class _ListMoviesState extends State<ListMovies> {
  MoviesDatabase? moviesDB;

  @override
  void initState() {
    super.initState();
    moviesDB = MoviesDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Peliculas :)"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(
              context,
              "/add",
            ).then((value) => setState(() {})),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: moviesDB!.SELECT(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something was wrong!'));
          } else {
            if (snapshot.hasData) {
              return snapshot.data!.isNotEmpty
                  ? ListView.separated(
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final objM = snapshot.data![index];
                        return Container(
                          height: 100,
                          color: Colors.grey,
                          child: Column(
                            children: [
                              Text(objM.movie!),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () => Navigator.pushNamed(
                                      context,
                                      "/add",
                                      arguments: objM,
                                    ).then((value) => setState(() {})),
                                    icon: Icon(Icons.edit),
                                  ),
                                  //Expanded(child: Container()),
                                  IconButton(
                                    onPressed: () async {
                                      return showDialog(
                                        context: context,
                                        builder: (context) =>
                                            _buildAlertDialog(objM.id_movie!),
                                      );
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : Center(child: Text('No existen registros'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }

  Widget _buildAlertDialog(int id_movie) {
    return AlertDialog(
      title: Text('Atención'),
      content: Text('¿Deseas eliminar el registro?'),
      actions: [
        TextButton(
          onPressed: () =>
              moviesDB!.DELETE("movies", id_movie).then((int value) {
                final msj;
                if (value > 0) {
                  msj = "Se borró correctamente";
                  setState(() {});
                } else {
                  msj = "Hubo algun error al eliminarlo";
                }
                final SnackBar snack = SnackBar(content: Text(msj));
                ScaffoldMessenger.of(context).showSnackBar(snack);
              }),
          child: Text('Aceptar', style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancelar', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
