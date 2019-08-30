import 'package:flutter/material.dart';

class MealDetailsPage extends StatelessWidget {
  static const routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Title $mealId'),
      ),
      body: Center(
        child: Text('Meal details...'),
      ),
    );
  }
}
