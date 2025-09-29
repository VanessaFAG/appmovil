// ignore_for_file: non_constant_identifier_names

class MovieDao {
  int? id_movie;
  String? movie;
  String? tiempo;
  String? date_reseale;

  MovieDao({this.id_movie, this.movie, this.tiempo, this.date_reseale});

  factory MovieDao.fromMap(Map<String, dynamic> mapa){
    //factory es un constructor que regresa una instancia de la clase, constructor nombrado
    return MovieDao(
      id_movie: mapa['id_movie'],
      movie: mapa['movie'],
      tiempo: mapa['tiempo'],
      date_reseale: mapa['date_reseale']
    );
  }
}