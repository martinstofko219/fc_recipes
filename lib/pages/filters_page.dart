import 'package:flutter/material.dart';

import '../widgets/nav_drawer.dart';

class FiltersPage extends StatelessWidget {
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Filters'),
      ),
      drawer: NavDrawer(),
      body: SafeArea(
        child: Text('Filters...'),
      ),
    );
  }
}
