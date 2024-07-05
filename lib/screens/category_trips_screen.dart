import 'package:flutter/material.dart';
import 'package:traveling/models/trip.dart';
import 'package:traveling/widgets/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = '/CategoryTrips';
  final List<Trip> avilableTrips;

  const CategoryTripsScreen({super.key, required this.avilableTrips,});
  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {

 late String categoryTitle;
 late List<Trip> displayTrips;


@override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgument = ModalRoute.of(context)?.settings.arguments as Map<String , String>;
    final  categoryId = routeArgument['id'];
     categoryTitle = routeArgument['title']!;
    displayTrips = widget.avilableTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId){
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemBuilder: (context , index){
          return TripItem(
            id: displayTrips[index].id,
            title: displayTrips[index].title ,
            imageUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            tripType: displayTrips[index].tripType, 
            season: displayTrips[index].season,
            //removeItem: _removeTrip,
             );
        },
         itemCount: displayTrips.length,
        ),
    );
  }
}