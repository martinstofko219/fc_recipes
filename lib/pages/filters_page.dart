import 'package:flutter/material.dart';

import '../widgets/nav_drawer.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> filters;
  final void Function(Map<String, bool>) onSaveFilters;

  FiltersPage({@required this.filters, @required this.onSaveFilters});

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.filters['glutenFree'];
    _lactoseFree = widget.filters['lactoseFree'];
    _vegan = widget.filters['vegan'];
    _vegetarian = widget.filters['vegetarian'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveFilters,
          )
        ],
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

  void _saveFilters() {
    final selectedFilters = {
      'glutenFree': _glutenFree,
      'lactoseFree': _lactoseFree,
      'vegan': _vegan,
      'vegetarian': _vegetarian
    };
    widget.onSaveFilters(selectedFilters);
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
