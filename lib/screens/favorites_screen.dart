import 'package:flutter/material.dart';
import 'package:traveling/models/trip.dart';
import 'package:traveling/widgets/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  static const screenRoute = 'FavoritesScreen';
  final List<Trip> favorateTrips;
  
  const FavoritesScreen({super.key, required this.favorateTrips});

  @override
  Widget build(BuildContext context) {
    if (favorateTrips.isEmpty) {
      return const Center(
        child: Text('ليس لديك اي رحلة في قائمة المفضلة'),
      );
    }
    else
    {
      return ListView.builder(
        itemBuilder: (context , index){
          return TripItem(
            id: favorateTrips[index].id,
            title: favorateTrips[index].title ,
            imageUrl: favorateTrips[index].imageUrl,
            duration: favorateTrips[index].duration,
            tripType: favorateTrips[index].tripType, 
            season: favorateTrips[index].season,
            //removeItem: _removeTrip,
             );
        },
         itemCount: favorateTrips.length,
        );
    }
  }
}