/*import 'package:flutter/material.dart';
import 'package:movil2025/database/movies_database.dart';

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({super.key});

  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  
  MoviesDatabase? moviesDB;
  TextEditingController conTitle = TextEditingController();
  TextEditingController conTime = TextEditingController();
  TextEditingController conRelease = TextEditingController();

  @override
  void initState() {
    super.initState();
    moviesDB = MoviesDatabase();
  }
  
  @override
  Widget build(BuildContext context) {

    conRelease.text = _selectedDate.toString() ;

    final txtTitle = TextFormField(
      controller: conTitle,
      decoration: InputDecoration(
        hintText: "Tilulo de la pelicula"
      ),
    );

    final txtTime = TextFormField(
      controller: conTime,
      onTap: () => _selectedDate(context),
      decoration: InputDecoration(
        hintText: "Duración"
      ),
    );

     final txtRelease = TextFormField(
      controller: conRelease,
      decoration: InputDecoration(
        hintText: "Fecha de estreno"
      ),
    );

    final btnGuadar = ElevatedButton(onPressed: (){}, child: Text("Guardar"));

    return Scaffold(
      appBar: AppBar(title: const Text("Inserte una pelicula"),),
      body: ListView(
        shrinkWrap: true,
        children: [
          txtTitle,
          txtTime,
          txtRelease,
          btnGuadar
        ],
      ),
    );

  }

  _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025)
    );
    if (picked != null && picked != selectedDate());
  }
}*/