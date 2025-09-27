import 'package:flutter/material.dart';
import 'package:movil2025/utils/diamond_botton.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final double rating;

  const DetailsScreen({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(// imagen
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              // botones de cantidad ya con la forma del rombo arcaico
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DiamondButton(
                  icon: Icons.remove,
                  size: 40,
                  color: Colors.red,
                  iconColor: Colors.white,
                  onPressed: () {},
                ),
                const Text(
                  "1",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                DiamondButton(
                  icon: Icons.add,
                  size: 40,
                  color: Colors.red,
                  iconColor: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),

            const SizedBox(height: 20),

            Container(//informacion de la comida, fijo todos diran lo mesmo
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Fast food",
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  const SizedBox(height: 8),

                  Row(//titulo y las estrellas
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            rating.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Descripción generica del lorem xd
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                    "Etiam at mi vitae augue feugiat scelerisque in a eros.",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 20),

                  // tiempo del pedido
                  Row(
                    children: const [
                      Icon(
                        Icons.access_time,
                        color: Color.fromARGB(255, 255, 17, 0),
                        size: 20,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "25 mins",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Row( //precio y el carrito, su boton pues
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total Price",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            price,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 17, 0),
                            ),
                          ),
                        ],
                      ),
                      DiamondButton(//carrito con la forma del rombo arcaico
                        icon: Icons.shopping_cart,
                        size: 70,
                        color: Colors.red,
                        iconColor: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
