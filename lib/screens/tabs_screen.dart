import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_test_app/providers/favorites_provider.dart';
import 'package:flutter_test_app/screens/categories_screen.dart';
import 'package:flutter_test_app/screens/filters_screen.dart';
import 'package:flutter_test_app/screens/meals_screen.dart';
import 'package:flutter_test_app/providers/meals_provider.dart';
import 'package:flutter_test_app/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  var _selectedFilters = kInitialFilters;

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
          .push<Map<Filter, bool>>(MaterialPageRoute(
              builder: (ctx) => FiltersScreen(
                    currentFilters: _selectedFilters,
                  )))
          .then((filters) => {
                setState(() {
                  _selectedFilters = filters ?? kInitialFilters;
                })
              });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    final availableMeals = meals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }

      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }

      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }

      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Map<int, Map<String, Widget>> pageMenu = {
      0: {
        'title': const Text('Categories'),
        'page': CategoriesScreen(
          availableMeals: availableMeals,
        )
      },
      1: {
        'title': const Text('Your Favorites'),
        'page': MealsScreen(
          meals: favoriteMeals,
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
