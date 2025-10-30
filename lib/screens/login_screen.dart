//statefull es cuando necesita redenrizar la interfaz
//stateless es cuando no cesetita cambiar la interfaz
import 'dart:ui'; // Necesario para BackdropFilter
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movil2025/firebase/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Cambiamos los nombres para coincidir con el estilo del compañero
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false; // Renombramos 'validando' a 'isLoading'
  FirebaseAuthentication? firebaseAuthentication;

  @override
  void initState() {
    super.initState();
    firebaseAuthentication = FirebaseAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    // Lógica para modo oscuro/claro del compañero
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final opacityDark = isDark ? 0.5 : 1.0;

    // Campos de texto estilizados (del compañero)
    final txtEmail = TextField(
      keyboardType: TextInputType.emailAddress,
      controller: userController, // Usamos el nuevo nombre del controlador
      style: TextStyle(color: isDark ? Colors.white : Colors.black),
      decoration: InputDecoration(
        hintText: 'Correo electrónico',
        hintStyle: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
        filled: true,
        fillColor: isDark ? Colors.white.withOpacity(0.3) : Colors.grey[200],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final txtPass = TextField(
      obscureText: true,
      controller: passwordController, // Usamos el nuevo nombre del controlador
      style: TextStyle(color: isDark ? Colors.white : Colors.black),
      decoration: InputDecoration(
        hintText: 'Contraseña',
        hintStyle: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
        filled: true,
        fillColor: isDark ? Colors.white.withOpacity(0.3) : Colors.grey[200],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false, // Lo mantenemos de tu código
      // Esta es la UI de Stack del compañero
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: opacityDark,
              child: Image.asset(
                "assets/gojira.jpeg", // USAMOS TU IMAGEN de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Bienvenido',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontSize: 35, // Aumentamos un poco el tamaño
                      // fontFamily: 'Vikings', // Puedes añadir fuentes si quieres
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // El contenedor con desenfoque del compañero
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: isDark
                              ? Colors.white.withOpacity(0.1)
                              : Colors.black.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          children: [
                            txtEmail, // Tu campo de email (ahora txtEmail)
                            const SizedBox(height: 10),
                            txtPass, // Tu campo de pass (ahora txtPass)
                            const SizedBox(height: 20),
                            // Botón de Login (del compañero)
                            ElevatedButton(
                              onPressed: () => loginWithFirebase(), // Llama a TU lógica
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isDark
                                    ? Colors.blue[200]
                                    : Colors.blue[300],
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 15,
                                ),
                              ),
                              child: const Text(
                                'Iniciar sesión',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            // Botón de Registro (del compañero)
                            TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, "/registro"), // Tu ruta
                              child: Text(
                                'Registrarse',
                                style: TextStyle(color: Colors.blue[200]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Animación Lottie (del compañero, pero con TU asset)
                  if (isLoading)
                    Lottie.asset("assets/loading.json", height: 200) // TU LOTTIE
                  else
                    Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Eliminamos la función showToast
  /*
  void showToast(
    String mensaje, {
    ToastificationType? tipo,
    AlignmentGeometry? align,
  }) {
    toastification.show(
      context: context,
      title: Text(mensaje),
      autoCloseDuration: const Duration(seconds: 4),
      type: tipo,
      alignment: align ?? Alignment.topCenter,
      style: ToastificationStyle.flat,
    );
  }
  */

  // --- ESTA ES TU LÓGICA DE FIREBASE (CORRECTA) ---
  // --- ADAPTADA PARA USAR 'isLoading' y 'AlertDialog' ---
  Future<void> loginWithFirebase() async {
    // Usamos los nuevos nombres de controladores
    final email = userController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      // Usamos _showErrorDialog en lugar de showToast
      _showErrorDialog("Campos vacíos", "Por favor, ingresa correo y contraseña.");
      return;
    }

    // 1. Mostramos el Lottie (usando isLoading)
    setState(() {
      isLoading = true;
    });

    try {
      // 2. Intentamos hacer login (Esta es TU lógica, la correcta)
      await firebaseAuthentication?.loginWithEmailAndPassword(email, password);

      // 4. Navegamos al home
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/home',
        (route) => false,
      );
    } catch (e) {
      // 5. Si hubo un error, lo mostramos con showToast
      print(e);
      // 5. Si hubo un error, lo mostramos con _showErrorDialog
      print(e);
      _showErrorDialog(
          "Error de Autenticación", "Correo o contraseña incorrectos. Intenta de nuevo.");
    } finally {
      // 6. Ocultamos el Lottie
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Aceptar"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}