import 'package:flutter/material.dart';
import 'package:meals_app/models/meal/meal.dart';
import 'package:meals_app/pages/meal_details_page.dart';
import 'package:meals_app/widgets/meal/meal_item.dart';

class MealsPage extends StatelessWidget {
  const MealsPage({
    super.key,
    required this.title,
    required this.meals,
    required this.onToggleFavorite,
  });

  final String title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void _onSelectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealDetailsPage(meal: meal, onToggleFavorite: onToggleFavorite),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemBuilder: (ctx, index) => Text(meals[index].title),
      itemCount: meals.length,
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'No meals found!',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      );
    } else {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) => _onSelectMeal(context, meals[index]),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: content,
    );
  }
}
