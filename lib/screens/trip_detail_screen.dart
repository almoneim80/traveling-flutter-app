import 'package:flutter/material.dart';
import 'package:traveling/app_data.dart';

class TripDetailScreen extends StatelessWidget {
  final Function manageFavorate;
  final Function isFavorate;
  static String screenRout = 'TripDetailScreen';

   const TripDetailScreen({super.key, required this.manageFavorate, required this.isFavorate});

   Widget builderSectionTitle(BuildContext context,String title, ){
    return Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Text(
             title ,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          );
   }

   Widget buildListViewContenar(Widget child){
    return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0)
            ),
            height: 200.0,
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            child: child);
   }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = trips_data.firstWhere((trip) => trip.id == tripId);
     
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTrip.title,
        style: Theme.of(context).textTheme.headlineSmall,
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300.0,
              width: double.infinity,
              child: Image.network(selectedTrip.imageUrl , fit: BoxFit.cover,),
            ),
            const SizedBox(height: 10.0,),
            builderSectionTitle(context, 'الأنشطة'),
            buildListViewContenar( ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (context , index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: Text(selectedTrip.activities[index]),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            builderSectionTitle(context, 'البرنامج اليومي'),
            buildListViewContenar(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (context , index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1} يوم'),
                        ),
                        title: Text(selectedTrip.program[index]),
                    ),
                    const Divider(),
                  ],
                ),
              ),
              ),
              const SizedBox(height: 100.0,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => manageFavorate(tripId),
        child: Icon(
          isFavorate(tripId) ? Icons.star : Icons.star_border
        ),
      ),
      );
  }
}