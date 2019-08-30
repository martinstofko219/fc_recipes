import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../pages/meal_details_page.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem(this.meal);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToMeal(context),
      splashColor: Theme.of(context).splashColor,
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                _buildMealImage(meal.imageUrl),
                _buildMealName(context, meal.name),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildMealDataRow(
                      context, Icons.watch_later, '${meal.cookTime} min'),
                  _buildMealDataRow(
                      context, Icons.category, meal.complexityString),
                  _buildMealDataRow(
                      context, Icons.monetization_on, meal.affordabilityString),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMealImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
      child: Image.network(
        imageUrl,
        height: 250.0,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildMealName(BuildContext context, String name) {
    return Positioned(
      bottom: 8.0,
      right: 16.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.black54,
        ),
        padding: const EdgeInsets.all(8.0),
        width: 248,
        child: Text(
          name,
          style: Theme.of(context).textTheme.headline.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }

  Widget _buildMealDataRow(BuildContext context, IconData icon, String text) {
    return Row(
      children: <Widget>[
        Icon(icon, color: Colors.black54),
        SizedBox(width: 4.0),
        Text(text, style: Theme.of(context).textTheme.caption),
      ],
    );
  }

  void _navigateToMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailsPage.routeName, arguments: meal.id);
  }
}
