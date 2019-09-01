import 'package:flutter/material.dart';

import '../models/category.dart';
import '../pages/meals_page.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.0),
      onTap: () => _navigateToMeals(context),
      splashColor: Theme.of(context).splashColor,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4.0,
              offset: Offset(0, 1),
            ),
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(16.0),
          gradient: LinearGradient(
            colors: [category.color.withOpacity(0.54), category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            category.name.toUpperCase(),
            style: Theme.of(context).textTheme.subhead.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
          ),
        ),
      ),
    );
  }

  void _navigateToMeals(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealsPage.routeName,
      arguments: {'id': category.id, 'name': category.name},
    );
  }
}
