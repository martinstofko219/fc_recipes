import 'package:flutter/material.dart';

import '../dummy-data.dart';

class MealsPage extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryName = routeArgs['name'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final meal = categoryMeals[index];

          return Card(
            child: ListTile(
              title: Text(meal.name),
            ),
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
