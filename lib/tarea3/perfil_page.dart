import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Stack(// Fondo rojo con avatar
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 120,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 17, 0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              Positioned(
                bottom: -40,
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      "https://thispersondoesnotexist.com/",
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 60),


          const Text(//datos de la persona fijos sjsjsj
            "Julia Edwards",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text("juliaedwards@gmail.com",
              style: TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 2),
          const Text("+1234567890",
              style: TextStyle(fontSize: 16, color: Colors.grey)),

          const SizedBox(height: 16),

          ElevatedButton(//boton para editar el perfil, no lleva a ningun lado
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 17, 0),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Edit Profile",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 24),

          //opciones
          _buildOption("My Orders"),
          _buildOption("My Addresses"),
          _buildOption("My Favourites"),
          _buildOption("Coupons"),
        ],
      ),
    );
  }

  Widget _buildOption(String title) {//este crea las tarjetas
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
            Text(
              title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
