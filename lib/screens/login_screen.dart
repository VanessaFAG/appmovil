//statefull es cuando necesita redenrizar la interfaz
//stateless es cuando no cesetita cambiar la interfaz

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController conUser = TextEditingController();
  TextEditingController conPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final txtUser = TextField(
      keyboardType: TextInputType.emailAddress,
      controller: conUser,
      decoration: InputDecoration(
        hintText: 'correo'
      ),
    );
    final txtPass = TextField(
      obscureText: true,
      controller: conPass,
      decoration: InputDecoration(
        hintText: 'contaseña'
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        //visualiza la imagen
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/momokaido.jpeg"),
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Positioned(
              top: 200,
              child: Text(
                "One Pice",
                style: TextStyle(color: const Color.fromARGB(255, 162, 123, 4), fontSize: 35),
              ),
            ),
            Positioned(
              bottom: 75,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .30,
                decoration:
                BoxDecoration(
                  color: Color.fromARGB(86, 185, 185, 185), 
                  borderRadius: BorderRadius.circular(25)
                  ),
                  child: Column(
                    children: [
                      txtUser,
                      txtPass,
                      IconButton(onPressed: (){},
                       icon: Icon(Icons.login, size: 45,))
                    ],
                  ),                
              )
              ),
          ],
        ),
      ),
    );
  }
}
