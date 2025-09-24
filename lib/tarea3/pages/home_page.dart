import 'package:flutter/material.dart';
import 'package:movil2025/tarea3/details_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     final TextEditingController searchController = TextEditingController();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alinea el texto a la izquierda
          children: [
            Text(
              "Find your Best food here",
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ), //Un espacio para que no se peguen los widgets
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFF0F0F0),
                hintText: 'Search food...',
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Colors.grey[600]),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none, // Sin borde
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 193, 116, 111),
                  ), // Borde rojo al seleccionar
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    "Popular Menu",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "See All",
                style: TextStyle(
                  color: const Color.fromARGB(255, 193, 116, 111),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            title: "Delicious Pizza",
                            description:
                                "Una pizza deliciosa con ingredientes frescos y masa artesanal.",
                            image:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrgh6Xx8CBnZM8NPOmIEOwqV_KK6PnE1pluA&s",
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 160,
                      margin: const EdgeInsets.only(right: 16.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 240, 240),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                            child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrgh6Xx8CBnZM8NPOmIEOwqV_KK6PnE1pluA&s',
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delicious Pizza',
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  '\$12.99',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      193,
                                      116,
                                      111,
                                    ),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
