import 'package:flutter/material.dart';

import 'pages/categories_page.dart';
import 'pages/meal_details_page.dart';
import 'pages/meals_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yummy Meals',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.teal,
        canvasColor: Color.fromRGBO(245, 245, 245, 1),
        fontFamily: 'SourceSansPro',
      ),
      home: CategoriesPage(),
      routes: {
        MealsPage.routeName: (_) => MealsPage(),
        MealDetailsPage.routeName: (_) => MealDetailsPage(),
      },
      onUnknownRoute: (_) {
        return MaterialPageRoute(builder: (_) => CategoriesPage());
      },
    );
  }
}
