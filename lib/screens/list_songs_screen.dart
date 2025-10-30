import 'package:flutter/material.dart';
import 'package:movil2025/firebase/song_firebase.dart';

class ListSongsScreen extends StatefulWidget {
  const ListSongsScreen({super.key});

  @override
  State<ListSongsScreen> createState() => _ListSongsScreenState();
}

class _ListSongsScreenState extends State<ListSongsScreen> {
  SongFirebase songFirebase = SongFirebase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de canciones')),
      body: StreamBuilder(
        stream: songFirebase.selectSong(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data!.docs[index].get('title'));
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar las canciones'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
