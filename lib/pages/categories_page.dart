import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal/meal.dart';
import 'package:meals_app/pages/meals_page.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

import '../models/category.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key, required this.onToggleFavorite});

  final void Function(Meal meal) onToggleFavorite;

  void _selectCategory(BuildContext context, Category category) {
    final List<Meal> meals = dummyMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsPage(
          title: category.title,
          meals: meals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Center(
        child: GridView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            // for (final cat in availableCategories)
            //   CategoryGridItem(category: cat),
            ...availableCategories.map(
              (cat) => CategoryGridItem(
                category: cat,
                onSelectCategory: () {
                  _selectCategory(context, cat);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
