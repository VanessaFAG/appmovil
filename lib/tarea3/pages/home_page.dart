import 'package:flutter/material.dart';
import 'package:movil2025/tarea3/details_screen.dart';
import 'package:movil2025/utils/diamond_botton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Controlador para la barra de búsqueda
  final TextEditingController searchController = TextEditingController();

  /// Controlador para el scroll horizontal de los platillos
  final ScrollController _scrollController = ScrollController();

  /// Índice del platillo actualmente seleccionado (centrado)
  int _currentIndex = 0;

  /// Lista de categorías disponibles
  final List<String> categories = ["Fast food", "Drink", "Snacks", "Dessert"];

  /// Categoría seleccionada por defecto
  String _selectedCategory = "Fast food";

  /// Lista de platillos con sus datos
  final List<Map<String, dynamic>> foodItems = [
    {
      "title": "Egg Pasta",
      "price": "\$15.00", // el '/' es para que no tome el $ como un caracter especial :b
      "image": "assets/tarea3/egg.png",
      "rating": 5.0,
    },
    {
      "title": "Fried Chicken",
      "price": "\$25.00",
      "image": "assets/tarea3/chicken.png",
      "rating": 4.5,
    },
    {
      "title": "Dan Noodles",
      "price": "\$10.00",
      "image": "assets/tarea3/noodles.png",
      "rating": 3.5,
    },
    {
      "title": "Chesse Sandwich",
      "price": "\$18.00",
      "image": "assets/tarea3/chanwis.png",
      "rating": 4.0,
    },
    {
      "title": "Vegan Pizza",
      "price": "\$20.00",
      "image": "assets/tarea3/pizza.png",
      "rating": 4.5,
    },
  ];

  @override
  void initState() {
    super.initState();
    // Detecta el scroll horizontal para resaltar el platillo actual
    _scrollController.addListener(() {
      const cardWidth = 160.0 + 16.0; // ancho + margen
      int newIndex = (_scrollController.offset / cardWidth).round();
      if (newIndex != _currentIndex) {
        setState(() {
          _currentIndex = newIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    // Libera los controladores al cerrar la pantalla
    _scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Encabezado
            const Text("Find your", style: TextStyle(fontSize: 24)),
            const Text(
              "Best Food here",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Barra de búsqueda + botón de filtros
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF5F3F6),
                      hintText: 'Search food...',
                      hintStyle: const TextStyle(color: Color(0xFF989898)),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFF989898),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Botón con forma de diamante
                DiamondButton(
                  icon: Icons.tune,
                  size: 50,
                  color: const Color.fromARGB(255, 230, 0, 35),
                  iconColor: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Lista de categorías
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return _buildCategory(
                    category,
                    isActive: category == _selectedCategory, // categoría activa
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Botón "See All"
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "See All",
                    style: TextStyle(
                      color: Color.fromARGB(255, 230, 0, 35),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Lista horizontal de platillos (cards)
            SizedBox(
              height: 240,
              child: ListView.builder(
                controller: _scrollController,
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  final item = foodItems[index];
                  return _buildFoodCard(
                    context,
                    title: item['title'],
                    price: item['price'],
                    image: item['image'],
                    rating: item['rating'],
                    isActive: index == _currentIndex, // platillo resaltado
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget para mostrar cada categoría
  Widget _buildCategory(
    String name, {
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? const Color.fromARGB(255, 230, 0, 35)
              : const Color(0xFFF2EFFF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  /// Widget para mostrar cada tarjeta de platillo
  Widget _buildFoodCard(
    BuildContext context, {
    required String title,
    required String price,
    required String image,
    required double rating,
    required bool isActive,
  }) {
    // Tamaño dinámico según si está resaltado
    final double cardWidth = isActive ? 180 : 160;
    final double cardHeight = isActive ? 220 : 200;
    final double verticalMargin = isActive ? 0 : 10;

    return GestureDetector(
      // Al tocar un platillo, abre la pantalla de detalles
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: cardWidth,
        height: cardHeight,
        margin: EdgeInsets.only(
          right: 16,
          top: verticalMargin,
          bottom: verticalMargin,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 6,
              offset: const Offset(3, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del platillo
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(
                image,
                height: isActive ? 140 : 120,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: isActive ? 140 : 120,
                  color: Colors.grey[200],
                  child: const Icon(Icons.restaurant, color: Colors.grey),
                ),
              ),
            ),
            // Texto con datos del platillo
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    // Calificación con estrellita
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 176, 176, 176),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    // Precio
                    Text(
                      price,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 230, 0, 35),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
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
