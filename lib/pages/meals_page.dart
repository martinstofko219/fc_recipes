import 'package:flutter/material.dart';

class MealsPage extends StatelessWidget {
  final String categoryId;
  final String categoryName;

  MealsPage(this.categoryId, this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Center(
        child: Text('$categoryName meal list...'),
      ),
    );
  }
}
