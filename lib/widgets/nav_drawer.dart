import 'package:flutter/material.dart';

import 'nav_drawer_item.dart';
import '../pages/filters_page.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomLeft,
            color: Theme.of(context).primaryColor,
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
            height: 120.0,
            width: double.infinity,
            child: Text(
              'Yummy Meals',
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(color: Colors.white),
            ),
          ),
          NavDrawerItem(
            text: 'My Meals',
            icon: Icons.restaurant,
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          NavDrawerItem(
            text: 'Filter Meals',
            icon: Icons.settings,
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(FiltersPage.routeName),
          ),
        ],
      ),
    );
  }
}
