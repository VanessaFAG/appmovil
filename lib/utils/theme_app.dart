import 'package:flutter/material.dart';

class ThemeApp{

 static ThemeData darkTheme (){
  final theme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme(
      brightness: Brightness.dark, 
      primary: Colors.black38, 
      onPrimary: Colors.blueGrey,
      secondary: Colors.indigo,
      onSecondary: Colors.indigoAccent, 
      error: Colors.redAccent,
      onError: Colors.red, 
      surface: Colors.white70, 
      onSurface: Colors.white
      )
  );
  return theme;
 }

  static ThemeData ligthTheme (){
  final theme = ThemeData.light().copyWith(
    colorScheme: ColorScheme(
      brightness: Brightness.dark, 
      primary: const Color.fromARGB(188, 175, 141, 83), 
      onPrimary: const Color.fromARGB(255, 169, 206, 224),
      secondary: Colors.indigo,
      onSecondary: Colors.indigoAccent, 
      error: Colors.redAccent,
      onError: Colors.red, 
      surface: Colors.white70, 
      onSurface: Colors.white
      )
  );
  return theme;
 }
}