import 'package:flutter/material.dart';
import '../utils/value_listener.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index, String? nombre) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/tarea1');
        break;
      case 1:
        Navigator.pushNamed(context, '/foodie');
        break;
      case 2:
        Text("Notificaciones");
        break;
      case 3:
        Text("Ver perfil");
        break;
    }
  }


  Widget _buildGridButton(IconData icon, String label, int index) {//grid de los botones
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: () => _onItemTapped(index, label),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          const SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildIcon(//construcción de botones
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
          decoration: BoxDecoration(
            color: isSelected
                ? const Color.fromARGB(255, 189, 129, 81).withValues(alpha: 0.2)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: AnimatedScale(
            scale: isSelected ? 1.3 : 1.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Icon(
              isSelected ? filledIcon : outlinedIcon,
              color: isSelected
                  ? Color.fromARGB(255, 141, 124, 43)
                  : Color.fromARGB(255, 170, 115, 60),
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
      appBar: AppBar(
        title: const Text('Main'),
        actions: [
          ValueListenableBuilder(
            valueListenable: ValueListener.isLigth,
            builder: (context, value, child) {
              return value
                  ? IconButton(
                      onPressed: () {
                        ValueListener.isLigth.value = false;
                      },
                      icon: Icon(Icons.light_mode),
                    )
                  : IconButton(
                      onPressed: () {
                        ValueListener.isLigth.value = true;
                      },
                      icon: Icon(Icons.dark_mode),
                    );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [_buildGridButton(Icons.note, "Tarea 1", 0), _buildGridButton(Icons.fastfood, "Foodie", 1)],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shadowColor: Colors.amber,
        elevation: 5,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [// botones de navegación
            _buildIcon(Icons.home_outlined, Icons.home, 0, "home"),
            _buildIcon(
              Icons.notifications_outlined,
              Icons.notifications,
              1,
              "noti",
            ),
            _buildIcon(Icons.search_outlined, Icons.search, 2, "busqueda"),
            _buildIcon(Icons.person_outline, Icons.person, 3, "perfil"),
          ],
        ),
      ),
    );
  }
}