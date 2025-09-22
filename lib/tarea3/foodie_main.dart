import 'package:flutter/material.dart';

class FoodieMain extends StatefulWidget {
  const FoodieMain({super.key});

  @override
  State<FoodieMain> createState() => _FoodieMainState();
}

class _FoodieMainState extends State<FoodieMain> {
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
    }
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
                ? const Color.fromARGB(255, 160, 23, 23).withValues(alpha: 0.2)
                : const Color.fromARGB(193, 97, 97, 97),
            borderRadius: BorderRadius.circular(16),
          ),
          child: AnimatedScale(
            scale: isSelected ? 1.3 : 1.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Icon(
              isSelected ? filledIcon : outlinedIcon,
              color: isSelected
                  ? Color.fromARGB(255, 85, 84, 84)
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
        title: const Text('Foodie'),
      ),
      bottomNavigationBar: BottomAppBar(
        shadowColor: const Color.fromARGB(255, 111, 27, 27),
        elevation: 5,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [// botones de navegación
            _buildIcon(Icons.home_outlined, Icons.home, 0, "home"),
            _buildIcon(Icons.notifications_outlined, Icons.notifications, 1, "noti"),
            _buildIcon(Icons.search_outlined, Icons.search, 2, "busqueda"),
            _buildIcon(Icons.person_outline, Icons.person, 3, "perfil"),
          ],
        ),
      ),
    );
  }
}