import 'package:flutter/material.dart';
import 'package:movil2025/utils/diamond_botton.dart';

class FoodieMain extends StatefulWidget {
  const FoodieMain({super.key});

  @override
  State<FoodieMain> createState() => _FoodieMainState();
}

class _FoodieMainState extends State<FoodieMain> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;

  void _onItemTapped(int index, String? nombre) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
    }
  }

  Widget _buildIcon(
    //construcción de botones
    IconData outlinedIcon,
    IconData filledIcon,
    int index,
    String nombre,
  ) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index, nombre),
      child: Tooltip(
        message: nombre,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          /*decoration: BoxDecoration(
            color: isSelected
                ? const Color.fromARGB(255, 160, 23, 23).withValues(alpha: 0.2)
                : const Color.fromARGB(193, 97, 97, 97),
            borderRadius: BorderRadius.circular(16),
          ),*/
          child: AnimatedScale(
            scale: isSelected ? 1.3 : 1.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Icon(
              isSelected ? filledIcon : outlinedIcon,
              color: isSelected
                  ? Color.fromARGB(255, 244, 36, 36)
                  : Color.fromARGB(178, 197, 196, 196),
              size: 28,
            ),
          ),
        ),
      ),
    );
  }

  // metodo principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        actions: [
          /*CircleAvatar(
            backgroundColor: Colors.red,
            backgroundImage: NetworkImage(
              "https://thispersondoesnotexist.com/",
            ),
            onBackgroundImageError:(_, __) {},// Es para cuando detecte el error al cargar la imagen
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 28,
            ),
          ),*/
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DiamondButton(
              imageUrl: "https://thispersondoesnotexist.com/",
              size: 40,
              color: Colors.red,
              iconColor: Colors.white,
              onPressed: () {}, // Acción opcional
            ),
          ),
        ],
        leading: Builder(
          builder: (BuildContext context) {
            /*return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );*/
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: DiamondButton(
                icon: Icons.menu,
                size: 40,
                color: const Color.fromARGB(255, 75, 74, 74),
                iconColor: const Color.fromARGB(255, 0, 0, 0),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            );
          },
        ),
      ),
      body: Padding(
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
              controller: _searchController,
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
                  Container(
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
                            'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
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
                  
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        shadowColor: const Color.fromARGB(184, 0, 0, 0),
        child: NavigationDrawer(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "usuario",
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              accountEmail: Text(
                "@email.com",
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        child: BottomAppBar(
          shadowColor: const Color.fromARGB(255, 0, 0, 0),
          elevation: 25,
          shape: const CircularNotchedRectangle(),
          color: const Color.fromARGB(255, 255, 255, 255),
          notchMargin: 6.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // botones de navegación
              _buildIcon(Icons.home, Icons.home, 0, "home"),
              _buildIcon(Icons.favorite, Icons.favorite, 1, "favoritos"),
              _buildIcon(
                Icons.shopping_cart,
                Icons.shopping_cart,
                2,
                "carrito",
              ),
              _buildIcon(
                Icons.notifications,
                Icons.notifications,
                3,
                "notificaciones",
              ),
              _buildIcon(Icons.person, Icons.person, 4, "perfil"),
            ],
          ),
        ),
      ),
    );
  }
}
