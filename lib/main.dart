import 'package:flutter/material.dart';
import 'package:movil2025/utils/color_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('uncanivalley/practica 1'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          child: Center(
            child: Text(
              'Contador: $contador :b',
              style: TextStyle(fontSize: 25, color: ColorsApp.txtColor),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ads_click),
          onPressed: () {
            contador++;
            print(contador);
            setState(() {
              
            });
          },
        ),
      ),
    );
  }

  miEvnnto() {}
}
