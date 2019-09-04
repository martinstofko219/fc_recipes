import 'package:flutter/material.dart';

import 'dummy-data.dart';
import 'models/meal.dart';
import 'pages/categories_page.dart';
import 'pages/filters_page.dart';
import 'pages/meal_details_page.dart';
import 'pages/meals_page.dart';
import 'pages/tabs_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;

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
      home: TabsPage(),
      routes: {
        // '/': (_) => TabsPage(),
        MealsPage.routeName: (_) => MealsPage(meals: _availableMeals),
        MealDetailsPage.routeName: (_) => MealDetailsPage(),
        FiltersPage.routeName: (_) =>
            FiltersPage(filters: _filters, onSaveFilters: _saveFilters),
      },
      onUnknownRoute: (_) {
        return MaterialPageRoute(builder: (_) => CategoriesPage());
      },
    );
  }

  void _saveFilters(Map<String, bool> filters) {
    setState(() {
      _filters = filters;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['glutenFree'] && !meal.isGlutenFree) return false;
        if (_filters['lactoseFree'] && !meal.isLactoseFree) return false;
        if (_filters['vegan'] && !meal.isVegan) return false;
        if (_filters['vegetarian'] && !meal.isVegetarian) return false;

        return true;
      }).toList();
    });
  }
}
