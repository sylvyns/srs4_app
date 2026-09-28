import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';
import 'home_page.dart';
import 'catalog_page.dart';
import 'favorites_page.dart';
import 'profile_page.dart';

// Главный экран, который переключает страницы через Bottom Bar
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0; // номер открытой страницы

  @override
  Widget build(BuildContext context) {
    // список страниц
    List<Widget> pages = [
      const HomePage(),
      const CatalogPage(),
      const FavoritesPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
