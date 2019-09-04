import 'package:flutter/material.dart';

import 'categories_page.dart';
import 'favorites_page.dart';
import '../widgets/nav_drawer.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<Map<String, dynamic>> _pages = [
    {'page': CategoriesPage(), 'title': 'Meal Categories'},
    {'page': FavoritesPage(), 'title': 'Favorite Meals'}
  ];
  var _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: NavDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
          ),
        ],
      ),
      body: _pages[_selectedPageIndex]['page'],
    );

    // SETUP FOR APP BAR TABS
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Yummy Meals'),
    //       bottom: TabBar(
    //         tabs: <Widget>[
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: 'Categories',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.favorite),
    //             text: 'Favorites',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: <Widget>[
    //         CategoriesPage(),
    //         FavoritesPage(),
    //       ],
    //     ),
    //   ),
    // );
  }

  void _selectTab(int index) {
    setState(() => _selectedPageIndex = index);
  }
}
