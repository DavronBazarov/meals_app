import 'package:flutter/material.dart';
import 'package:meals_app/screens/categiries_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

List<Map<String, dynamic>>? _pages;
int _selectedPageIndex = 0;

class _TabsScreenState extends State<TabsScreen> {
  @override
  void initState() {
    _pages = [
      {
        'page': const CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page':  FavoritesScreen(widget.favoriteMeals),
        'title': 'Favorites',
      },
    ];
    super.initState();
  }
  void _selectedPages(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages![_selectedPageIndex]["title"],
          style: const TextStyle(fontFamily: 'Raleway'),
        ),
      ),
      drawer: const MainDrawer(),
      body: _pages![_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedPages,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amber,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.category),
                backgroundColor: Theme.of(context).primaryColor,
                label: "Categories"),
            BottomNavigationBarItem(
                icon: const Icon(Icons.star),
                backgroundColor: Theme.of(context).primaryColor,
                label: "Favorites"),
          ]),
    );
  }
}
