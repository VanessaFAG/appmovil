import 'package:flutter/material.dart';

class ThemeApp{

 static ThemeData darkTheme (){
  final theme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme(
      brightness: Brightness.dark, 
      primary: const Color.fromARGB(168, 179, 169, 236), 
      onPrimary: Colors.blueGrey,
      secondary: Colors.indigo,
      onSecondary: Colors.indigoAccent, 
      error: Colors.redAccent,
      onError: Colors.red, 
      surface: const Color.fromARGB(179, 65, 76, 98), 
      onSurface: const Color.fromARGB(255, 190, 188, 188)
      )
  );
  return theme;
 }

  static ThemeData ligthTheme (){
  final theme = ThemeData.light().copyWith(
    colorScheme: ColorScheme(
      brightness: Brightness.dark, 
      primary: const Color.fromARGB(184, 152, 136, 101), 
      onPrimary: const Color.fromARGB(255, 124, 149, 161),
      secondary: Colors.indigo,
      onSecondary: Colors.indigoAccent, 
      error: Colors.redAccent,
      onError: Colors.red, 
      surface: const Color.fromARGB(210, 255, 255, 255), 
      onSurface: const Color.fromARGB(255, 0, 0, 0)
      )
  );
  return theme;
 }
}