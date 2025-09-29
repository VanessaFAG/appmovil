import 'package:flutter/material.dart';
import 'package:movil2025/tarea3/cart_page.dart';
import 'package:movil2025/tarea3/pages/home_page.dart';
import 'package:movil2025/tarea3/perfil_page.dart';
import 'package:movil2025/utils/diamond_botton.dart';

class FoodieMain extends StatefulWidget {
  const FoodieMain({super.key});

  @override
  State<FoodieMain> createState() => _FoodieMainState();
}

class _FoodieMainState extends State<FoodieMain> {
  /// Lista de páginas que se muestran según la opción del menú
  final List<Widget> _pages = [
    HomePage(),
    Center(child: Text('Favoritos')),
    CartPage(),
    Center(child: Text('Notificaciones')),
    PerfilPage(),
  ];

  /// Índice de la página seleccionada en el menú inferior
  int _selectedIndex = 0;

  /// Método que cambia la página seleccionada
  void _onItemTapped(int index, String? nombre) {
    setState(() {
      _selectedIndex = index;
    });
    // Aquí se pueden ejecutar acciones específicas por índice
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
    bool isSelected = _selectedIndex == index; // Verifica si está seleccionado
    return GestureDetector(
      onTap: () => _onItemTapped(index, nombre), // Cambia de página al tocar
      child: Tooltip(
        message: nombre, // Muestra el nombre al dejar el mouse encima
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
            scale: isSelected ? 1.3 : 1.0, // Agranda el icono si está activo
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Icon(
              isSelected ? filledIcon : outlinedIcon, // Icono activo o inactivo
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

      // Barra superior
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
            // Botón de perfil en forma de diamante con imagen de internet
            child: DiamondButton(
              imageUrl: "https://thispersondoesnotexist.com/",
              size: 40,
              color: Colors.grey,
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
            // Botón de menú en forma de diamante (abre el Drawer)
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: DiamondButton(
                icon: Icons.menu,
                size: 40,
                color: Colors.white,
                iconColor: const Color.fromARGB(255, 0, 0, 0),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            );
          },
        ),
      ),

      // Muestra la página según el índice seleccionado
      body: _pages[_selectedIndex],

      // Menú lateral (Drawer)
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

      // Barra inferior de navegación
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, -5), // sombra hacia arriba
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          child: BottomAppBar(
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
      ),
    );
  }
}