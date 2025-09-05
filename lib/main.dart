import 'package:flutter/material.dart';
import 'package:movil2025/screens/home_screen.dart';
import 'package:movil2025/screens/login_screen.dart';
import 'package:movil2025/utils/theme_app.dart';
import 'package:movil2025/utils/value_listener.dart';

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
    return ValueListenableBuilder(//siempre regresa un widget, genera/evalua una logica
          valueListenable: ValueListener.isLigth, 
      builder: (context,value, _) {//se puede poner un '_' en lugar de un child
        return MaterialApp(//raiz widgeth
        theme: value ? ThemeApp.ligthTheme() : ThemeApp.darkTheme(),
          routes: {
            "/home":(context) => HomeScreen() 
          },
          title: 'Marerial',
          home: LoginScreen(),
        
        );
      }
    );
  }

  miEvnnto() {}
}
