import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/categories_screen.dart';
import 'package:flutter_test_app/screens/meals_screen.dart';
import 'package:flutter_test_app/data/dummy_data.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<int, Map<String, Widget>> pageMenu = {
      0: {'title': const Text('Categories'), 'page': const CategoriesScreen()},
      1: {
        'title': const Text('Your Favorites'),
        'page': const MealsScreen(meals: [])
      }
    };

    final activePage = pageMenu[_selectedPageIndex];

    return Scaffold(
      appBar: AppBar(title: activePage!['title']),
      body: activePage['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => _selectPage(index),
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ]),
    );
  }
}
