import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final Color color;

  const CategoryItem(this.name, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: LinearGradient(
          colors: [color.withOpacity(0.64), color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Center(child: Text(name)),
    );
  }
}
