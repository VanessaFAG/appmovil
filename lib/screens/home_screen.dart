import 'package:flutter/material.dart';
import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:movil2025/utils/value_listener.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 75, 38, 174),
        actions: [
          ValueListenableBuilder(
            valueListenable: ValueListener.isLigth,
            builder: (context, value, _) {
              return value
                  ? IconButton(
                      onPressed: () {
                        ValueListener.isLigth.value = false;
                      },
                      icon: Icon(Icons.nightlight),
                    )
                  : IconButton(
                      onPressed: () {
                        ValueListener.isLigth.value = true;
                      },
                      icon: Icon(Icons.sunny),
                    );
            },
          ),
        ],
        title: Text("Main Menu"),
      ),
      body: _currentPage == 0
          ? const Center(child: Text("Home"))
          : _currentPage == 1
          ? const Center(child: Text("Favorites"))
          : _currentPage == 2
          ? const Center(child: Text("Search"))
          : const Center(
              child: Text("Profile"),
            ), //https://pub.dev/packages/theme_button/example
      bottomNavigationBar: DotCurvedBottomNav(
        scrollController: _scrollController,
        hideOnScroll: true,
        indicatorColor: const Color.fromARGB(255, 75, 38, 174),
        backgroundColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.ease,
        selectedIndex: _currentPage,
        indicatorSize: 5,
        borderRadius: 25,
        height: 70,
        onTap: (index) {
          setState(() => _currentPage = index);
        },
        items: [
          Icon(
            Icons.home,
            color: _currentPage == 0
                ? const Color.fromARGB(255, 75, 38, 174)
                : Colors.white,
          ),
          Icon(
            Icons.notifications,
            color: _currentPage == 1
                ? const Color.fromARGB(255, 75, 38, 174)
                : Colors.white,
          ),
          Icon(
            Icons.search,
            color: _currentPage == 2
                ? const Color.fromARGB(255, 75, 38, 174)
                : Colors.white,
          ),
          Icon(
            Icons.person,
            color: _currentPage == 3
                ? const Color.fromARGB(255, 75, 38, 174)
                : Colors.white,
          ),
        ],
      ),
    );
  }
}
