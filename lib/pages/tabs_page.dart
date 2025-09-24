import 'package:flutter/material.dart';
import 'package:meals_app/models/meal/meal.dart';
import 'package:meals_app/pages/meals_page.dart';

import 'categories_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() {
    return _TabsPageState();
  }
}

class _TabsPageState extends State<TabsPage> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _toggleFavorite(Meal meal) {
    setState(() {
      final isExisting = _favoriteMeals.contains(meal);

      if (isExisting) {
        _favoriteMeals.remove(meal);
        return;
      }
      _favoriteMeals.add(meal);
    });
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesPage(onToggleFavorite: _toggleFavorite);

    if (_selectedPageIndex == 1) {
      activePage = MealsPage(
        title: 'Favorites',
        meals: _favoriteMeals,
        onToggleFavorite: _toggleFavorite,
      );
    }
    return Scaffold(
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Category',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
