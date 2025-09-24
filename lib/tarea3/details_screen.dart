import 'package:flutter/material.dart';
import 'package:movil2025/utils/diamond_botton.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final String description;
  final String? image; 

  const DetailsScreen({
    Key? key,
    required this.title,
    required this.description,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DiamondButton(
                icon: Icons.arrow_back,
                size: 40,
                color: const Color.fromARGB(141, 75, 74, 74),
                iconColor: const Color.fromARGB(255, 0, 0, 0),
                onPressed: () {
                  Navigator.pushNamed(context, "/foodie");
                }, // Acción opcional
              ),
        ),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (image != null && image!.isNotEmpty)
              Image.network(image!, height: 200, fit: BoxFit.cover)
            else
              Container(
                height: 200,
                color: const Color.fromARGB(255, 6, 6, 6),
                child: const Center(
                  child: Icon(Icons.image_not_supported, size: 50),
                ),
              ),
            const SizedBox(height: 20),
            Text(
              description,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}