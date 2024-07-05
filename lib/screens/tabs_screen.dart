// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:traveling/models/trip.dart';
import 'package:traveling/screens/categories_screen.dart';
import 'package:traveling/screens/favorites_screen.dart';
import 'package:traveling/widgets/app_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Trip> favorateTrips;
  const TabsScreen({super.key, required this.favorateTrips});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedScreenIndex = 0;
  void _selectScreen(int index){
    setState(() {
      _selectedScreenIndex = index;
    });
  }

   late List<Map<String , Object>> _screens;  
  @override
  void initState() {
    _screens = [
    {
      'Screen' :  const CategoriesScreen(),
      'Title' : 'تصنيفات الرحلات',
    },
    {
       'Screen' :   FavoritesScreen(favorateTrips: widget.favorateTrips),
      'Title' : 'الرحلات المفضلة',
    }
  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text( _screens[_selectedScreenIndex] ['Title'] as String, style: Theme.of(context).textTheme.headlineMedium,),),
      drawer: const AppDrawer(),
      body: _screens[_selectedScreenIndex] ['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label:  'التصنيفات',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label:  'المفضلة',
            ),
        ],
        ),
    );
  }
}





//TabBar
/*
class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('دليل سياحي'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.dashboard),
                text: 'التصنيفات',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'المفضلة',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoriesScreen(),
            FavoritesScreen(),
          ],
          ),
      ),
    );
  }
}
*/