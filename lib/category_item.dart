import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final Color color;

  const CategoryItem(this.name, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          colors: [color.withOpacity(0.64), color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          name,
          style: Theme.of(context).textTheme.subhead,
        ),
      ),
    );
  }
}
