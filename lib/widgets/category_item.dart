import 'package:flutter/material.dart';
import 'package:traveling/screens/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  
  const CategoryItem({super.key, required this.title, required this.imageUrl, required this.id});

void selectCategory(BuildContext context)
{
  Navigator.of(context).pushNamed(
   CategoryTripsScreen.screenRoute,
    arguments: {
      'id' : id,
      'title' : title
    }
  );
}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Stack(
        children: [
          ClipRRect(
             borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(imageUrl,
            height: 250.0,
            fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
               color: Colors.black.withOpacity(0.4 ),
            ),
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
              ),
          ),
        ],
      ),
    );
  }
}