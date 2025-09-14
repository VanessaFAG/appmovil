//statefull es cuando necesita redenrizar la interfaz
//stateless es cuando no cesetita cambiar la interfaz

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController conUser = TextEditingController();
  TextEditingController conEmail = TextEditingController();
  TextEditingController conPass = TextEditingController();
  bool validando = false;

  @override
  Widget build(BuildContext context) {

    final txtUser = TextField(
      keyboardType: TextInputType.emailAddress,
      controller: conUser,
      decoration: InputDecoration(hintText: 'usuario')
    );
    final txtEmail = TextField(
      keyboardType: TextInputType.emailAddress,
      controller: conEmail,
      decoration: InputDecoration(hintText: 'correo')
    );
    final txtPass = TextField(
      obscureText: true,
      controller: conPass,
      decoration:
      InputDecoration(hintText: 'contaseña')
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        //visualiza la imagen del fondo
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/gojira.jpeg"),
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Positioned(
              top: 200,
              child: Text(
                "Bienvenido",
                style: TextStyle(
                  color: const Color.fromARGB(255, 10, 15, 60),
                  fontSize: 35,
                ),
              ),
            ),
            Positioned(
              bottom: 90,
              width: 320,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .30,
                decoration: BoxDecoration(
                  color: Color.fromARGB(165, 185, 185, 185),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    txtUser,
                    txtEmail,
                    txtPass,
                    IconButton(
                      onPressed: () {
                        if(!validar(conUser.text, conEmail.text, conPass.text)){
                          showDialog(
                            context: context, 
                            builder: (context){
                              return AlertDialog(
                                title: Text("Error"),
                                content: Text("Usuario/Correo o Contraseña incorrectos, por favor vuelva a intentarlo"),
                                actions: [
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    }, 
                                    child: Text("Aceptar"))
                                ],
                              );
                            });
                            return;
                        }
                        validando = true;
                        setState(() {});
                        Future.delayed(Duration(milliseconds: 3000)).then(
                          (value) => Navigator.pushNamed(context, "/home"),);
                        
                      },
                      icon: Icon(Icons.login, size: 45, color: Color.fromARGB(255, 10, 15, 60),),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 300,
              child: validando ? Lottie.asset("assets/loading.json",height: 200) : Container()
              )
          ],
        ),
      ),
    );
  }
}

validar(String user, String email, String pass){
  if(pass.isNotEmpty && (user.isNotEmpty || email.isNotEmpty)){
//valida que la contraseña no este vacia y que el usuario o correo no esten vacios, el usuario por el momento puede poner uno de los 2
    return true;
  }
  return false;
}
