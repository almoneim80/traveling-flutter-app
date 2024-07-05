import 'package:flutter/material.dart';
import 'package:traveling/models/trip.dart';
import 'package:traveling/screens/trip_detail_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  //final Function removeItem;

  const TripItem(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.tripType,
      required this.season,
      required this.id,
      // required this.removeItem
       });

  void selectTrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      TripDetailScreen.screenRout,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
       // removeItem(result);
        //print(result);
      }
    });
  }

  String get seasonText {
    switch (season) {
      case Season.Winter:
        return 'شتاء';
      case Season.Summer:
        return 'صيف';
      case Season.Autumn:
        return 'خريف';
      case Season.Spring:
        return 'ربيع';
    }
  }

  String get tripTypetext {
    switch (tripType) {
      case TripType.Exploration:
        return 'استكشاف';
      case TripType.Recovery:
        return 'نقاهة';
      case TripType.Activities:
        return 'أنشطة';
      case TripType.Therapy:
        return 'علاج';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 7.0,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250.0,
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: const [0.6, 1],
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineLarge,
                    overflow: TextOverflow.fade,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Colors.amber[800],
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text('$duration  أيام'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.sunny,
                        color: Colors.amber[800],
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(seasonText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Colors.amber[800],
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(tripTypetext),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
