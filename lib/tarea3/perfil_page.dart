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
          Container(
            height: 150,
            color: Colors.red,
            child: Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://thispersondoesnotexist.com/"), 
                backgroundColor: Colors.red,
              ),
            ),
          ),

          const SizedBox(height: 10),
          Text("Julia Edwards", style: TextStyle(fontSize: 24, color: Colors.black)),
          Text("juliaedwards@gmail.com", style: TextStyle(fontSize: 20, color: Colors.black)),
          Text("+1234567890", style: TextStyle(fontSize: 14, color: Colors.grey)),

          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Edit Profile"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          const SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.food_bank, color: Colors.black),
            title: Text("My Orders", style: TextStyle(fontSize: 18, color: Colors.black)),
            onTap: () {},
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.black),
            title: Text("My Addresses", style: TextStyle(fontSize: 18, color: Colors.black)),
            onTap: () {},
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.favorite, color: Colors.black),
            title: Text("My Favourites", style: TextStyle(fontSize: 18, color: Colors.black)),
            onTap: () {},
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.payment, color: Colors.black),
            title: Text("Coupons", style: TextStyle(fontSize: 18, color: Colors.black)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}