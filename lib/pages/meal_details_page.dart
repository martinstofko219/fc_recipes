import 'package:flutter/material.dart';

import '../dummy-data.dart';

class MealDetailsPage extends StatelessWidget {
  static const routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((m) => m.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 300.0,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              _buildSectionTitle(context, 'Ingredients'),
              ..._buildIngredientsList(context, selectedMeal.ingredients),
              _buildSectionTitle(context, 'Cooking Directions'),
              ..._buildCookingDirections(context, selectedMeal.steps),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}

List<Widget> _buildIngredientsList(
    BuildContext context, List<String> ingredients) {
  return ingredients.map((ingredient) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Text(' - $ingredient', style: Theme.of(context).textTheme.body1),
    );
  }).toList();
}

List<Widget> _buildCookingDirections(BuildContext context, List<String> steps) {
  var stepNumber = 0;
  return steps.map((step) {
    stepNumber++;
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).accentColor,
            foregroundColor: Colors.white,
            child: Text(stepNumber.toString()),
          ),
          title: Text(step),
        ),
        Divider(
          indent: 16.0,
        ),
      ],
    );
  }).toList();
}
