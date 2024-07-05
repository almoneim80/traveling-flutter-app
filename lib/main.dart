// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:traveling/app_data.dart';
import 'package:traveling/models/trip.dart';
import 'package:traveling/screens/category_trips_screen.dart';
import 'package:traveling/screens/filter_screen.dart';
import 'package:traveling/screens/tabs_screen.dart';
import 'package:traveling/screens/trip_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> _avilableTrips = trips_data;
  final List<Trip> _favorateTrips = [];

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _avilableTrips = trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        } else {
          return true;
        }
      }).toList();
    });
  }

  void _manageFavorate(String tripId) {
    final existingIndex = _favorateTrips.indexWhere((trip) => trip.id == tripId);
    if (existingIndex >= 0) {
      setState(() {
        _favorateTrips.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favorateTrips.add(trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  bool _isFavorate(String id) {
    return _favorateTrips.any((trip) => trip.id ==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'), // arabic
      ],
      debugShowCheckedModeBanner: false,
      title: 'Traveling App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ElMessiri',
        textTheme: ThemeData.light().textTheme.copyWith(
              headlineSmall: const TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold),
              headlineMedium: const TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 18,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold),
              headlineLarge: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold),
            ),
      ),
      //home: const TabsScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(favorateTrips: _favorateTrips),
        CategoryTripsScreen.screenRoute: (context) =>
            CategoryTripsScreen(avilableTrips: _avilableTrips),
        TripDetailScreen.screenRout: (context) => TripDetailScreen(manageFavorate: _manageFavorate, isFavorate: _isFavorate),
        FilterScreen.screenRoute: (context) =>
            FilterScreen(saveFilters: _changeFilters, currentFilters: _filters),
        //FavoritesScreen.screenRoute: (context) => const FavoritesScreen(favorateTrips: [],),
      },
    );
  }
}