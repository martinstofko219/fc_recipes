import 'package:flutter/material.dart';

import '../category_item.dart';
import '../dummy-data.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yummy Meals'),
      ),
      body: SafeArea(
        child: GridView(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          children: <Widget>[
            ...DUMMY_CATEGORIES.map((category) {
              return CategoryItem(category.name, category.color);
            }).toList()
          ],
        ),
      ),
    );
  }
}
