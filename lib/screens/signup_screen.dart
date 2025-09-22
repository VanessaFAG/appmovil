import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final ImagePicker _img = ImagePicker();
  File? _imgPerfil;

  final TextEditingController user = TextEditingController();
  final TextEditingController correo = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController confPass = TextEditingController();

  Future<void> _pickerImg(ImageSource source) async {
    try {
      final pickedFile = await _img.pickImage(source: source, imageQuality: 80);
      if (pickedFile != null) {
        setState(() {
          _imgPerfil = File(pickedFile.path);
        });
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Fallo al importar imagen"),
            content: Text(
              "Se generó un error al intentar importar la imgen, por favor seleccione e intente nuevamente.",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Aceptar"),
              ),
            ],
          );
        },
      );
    }
  }

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text("Imagen"),
                onTap: () {
                  _pickerImg(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera_outlined),
                title: const Text("Cámara"),
                onTap: () {
                  _pickerImg(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final txtUser = TextField(
      keyboardType: TextInputType.emailAddress,
      controller: user,
      decoration: InputDecoration(hintText: 'Nombre de usuario'),
    );
    final txtEmail = TextField(
      keyboardType: TextInputType.emailAddress,
      controller: correo,
      decoration: InputDecoration(hintText: 'Correo electronico'),
    );
    final txtPass = TextField(
      obscureText: true,
      controller: pass,
      decoration: InputDecoration(hintText: 'Contraseña'),
    );
    final txtPassConf = TextField(
      obscureText: true,
      controller: confPass,
      decoration: InputDecoration(hintText: 'Confirmar contraseña'),
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
            image: AssetImage("assets/godzilla.jpeg"),
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Positioned(
              top: 100,
              child: Text(
                "Crea tu cuenta",
                style: TextStyle(
                  color: const Color.fromARGB(255, 120, 128, 202),
                  fontSize: 35,
                ),
              ),
            ),
            Positioned(
              bottom: 115,
              width: 320,
              height: 450,
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
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => _showImageSourceActionSheet(context),
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.grey[400],
                        backgroundImage: _imgPerfil != null
                            ? FileImage(_imgPerfil!)
                            : null,
                        child: _imgPerfil == null
                            ? Icon(
                                Icons.add_a_photo,
                                color: Colors.white,
                                size: 40,
                              )
                            : null,
                      ),
                    ),
                    txtUser,
                    txtEmail,
                    txtPass,
                    txtPassConf,
                    IconButton(
                      onPressed: () {
                        try {
                          validar(user.text, correo.text, pass.text, confPass.text);
                        } catch (e) {
                          showDialog(
                            context: context, 
                            builder: (context){
                              return AlertDialog(
                                title: Text("Error"),
                                content: Text(e.toString()),
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
                        setState(() {});
                        Future.delayed(Duration(milliseconds: 3000)).then(
                          (value) => Navigator.pushNamed(context, "/home"),
                        );
                      },
                      icon: Icon(
                        Icons.login_outlined,
                        size: 45,
                        color: Color.fromARGB(255, 99, 63, 161),
                      ),
                    ),
                    ElevatedButton(
                      // crea el boton debajo del icono
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(
                          255,
                          10,
                          15,
                          60,
                        ), //color del fondo del boton
                        foregroundColor:
                            Colors.white, //color del texto del boton
                        minimumSize: Size(150, 40), //ancho y alto del boton
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                      ),
                      child: Text("Ya tienes cuenta? Inicia sesión"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void validar(String usuario, String correo, String pass, String confPass) {
  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(correo);
  if (usuario.isEmpty || correo.isEmpty || pass.isEmpty || confPass.isEmpty) {
    throw ("Por favor complete todos los campos.");
  }
  if (!emailValid) {
    throw ("El correo no es valido.");
  }
  if (pass != confPass) {
    throw ("Las contraseñas no coinciden.");
  }
}