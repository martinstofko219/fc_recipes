import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class MealsPage extends StatelessWidget {
  static const routeName = '/category-meals';

  final List<Meal> meals;

  MealsPage({@required this.meals});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryName = routeArgs['name'];
    final categoryMeals =
        meals.where((meal) => meal.categories.contains(categoryId)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            final meal = categoryMeals[index];
            return MealItem(meal);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
