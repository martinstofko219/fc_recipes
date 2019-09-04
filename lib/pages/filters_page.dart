import 'package:flutter/material.dart';

import '../widgets/nav_drawer.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Filters'),
      ),
      drawer: NavDrawer(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Adjust meal filters',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                      'Gluten Free',
                      'Only include gluten free meals',
                      _glutenFree,
                      (value) => setState(() => _glutenFree = value)),
                  _buildSwitchListTile(
                      'Lactose Free',
                      'Only include lactose free meals',
                      _lactoseFree,
                      (value) => setState(() => _lactoseFree = value)),
                  _buildSwitchListTile('Vegan', 'Only include vegan meals',
                      _vegan, (value) => setState(() => _vegan = value)),
                  _buildSwitchListTile(
                      'Vegetarian',
                      'Only include vegetarian meals',
                      _vegetarian,
                      (value) => setState(() => _vegetarian = value)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SwitchListTile _buildSwitchListTile(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }
}
