import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            child: UserAccountsDrawerHeader(
              currentAccountPicture: Image(image: NetworkImage("https://thispersondoesnotexist.com/")),
              accountName: Text("Julia Edwards"),
              accountEmail: Text("juliaedwards@gmail.com"),
              //Text("+1234567890"),
            ),
          ),
          
        ],
      )
    );
  }
}