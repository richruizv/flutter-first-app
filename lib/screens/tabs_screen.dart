import 'package:flutter/material.dart';
import 'package:flutter_test_app/models/meal.dart';
import 'package:flutter_test_app/screens/categories_screen.dart';
import 'package:flutter_test_app/screens/filters_screen.dart';
import 'package:flutter_test_app/screens/meals_screen.dart';
import 'package:flutter_test_app/data/dummy_data.dart';
import 'package:flutter_test_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();

    if (identifier == 'filters') {
      // This also could be pushReplacement, to delete the screan instead of add more screen
      Navigator.of(context)
          .push<Map<Filter, bool>>(
              MaterialPageRoute(builder: (ctx) => const FiltersScreen()))
          .then((value) => print(value));
    }
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleFavoriteMeal(Meal meal) {
    final index = _favoriteMeals.indexWhere((m) => m.id == meal.id);
    if (index < 0) {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage('Meal is no longer a favorite.');
      });
    } else {
      setState(() {
        _favoriteMeals.removeAt(index);
        _showInfoMessage('Marked as a favorite!');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<int, Map<String, Widget>> pageMenu = {
      0: {
        'title': const Text('Categories'),
        'page': CategoriesScreen(
          onClickFavoriteMeal: _toggleFavoriteMeal,
        )
      },
      1: {
        'title': const Text('Your Favorites'),
        'page': MealsScreen(
          meals: _favoriteMeals,
          onClickFavoriteMeal: _toggleFavoriteMeal,
        ),
      }
    };

    final activePage = pageMenu[_selectedPageIndex];

    return Scaffold(
      appBar: AppBar(title: activePage!['title']),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
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
