import 'package:flutter/material.dart';
import 'package:movil2025/tarea3/details_screen.dart';
import 'package:movil2025/utils/diamond_botton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 22, color: Colors.black),
              children: [
                TextSpan(text: "Find your "),
                TextSpan(
                  text: "Best Food ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: "here"),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFF0F0F0),
                    hintText: 'Search food...',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              DiamondButton(
                icon: Icons.tune,
                size: 50,
                color: Colors.red,
                iconColor: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),

          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategory("Fast food", isActive: true),
                _buildCategory("Drink"),
                _buildCategory("Snacks"),
                _buildCategory("Dessert"),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "See All",
                  style: TextStyle(
                    color: Color.fromARGB(255, 193, 116, 111),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          SizedBox(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildFoodCard(
                  context,
                  title: "Egg Pasta",
                  price:
                      "\$15.00", // el '/' es para que no tome el $ como un caracter especial :b
                  image: "assets/tarea3/egg.png",
                  rating: 5.0,
                ),
                _buildFoodCard(
                  context,
                  title: "Fried Chicken",
                  price: "\$25.00",
                  image: "assets/tarea3/chicken.png",
                  rating: 4.5,
                ),
                _buildFoodCard(
                  context,
                  title: "Dan Noodles",
                  price: "\$10.00",
                  image: "assets/tarea3/noodles.png",
                  rating: 3.5,
                ),
                _buildFoodCard(
                  context,
                  title: "Chesse Sandwich",
                  price: "\$18.00",
                  image: "assets/tarea3/chanwis.png",
                  rating: 4.0,
                ),
                _buildFoodCard(
                  context,
                  title: "Vegan Pizza",
                  price: "\$20.00",
                  image: "assets/tarea3/pizza.png",
                  rating: 4.5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(String name, {bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.red : const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  //cartas de comida, esqueleto
  Widget _buildFoodCard(
    BuildContext context, {
    required String title,
    required String price,
    required String image,
    required double rating,
    /*required String description*/
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
              title: title,
              image: image,
              rating: rating,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(
                image,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text(
                        rating.toString(),
                        style: TextStyle(color: Colors.red, fontSize: 10),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
