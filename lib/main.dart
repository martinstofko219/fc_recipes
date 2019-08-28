import 'package:flutter/material.dart';

import 'pages/categories_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yummy Meals',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.indigoAccent,
        canvasColor: Color.fromRGBO(245, 245, 245, 1),
        fontFamily: 'SourceSansPro',
      ),
      home: CategoriesPage(),
    );
  }
}
