import 'package:flutter/material.dart';
import 'package:traveling/widgets/category_item.dart';
import '../app_data.dart';
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          childAspectRatio: 7/8,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          ),
        children: categories_data.map((categoryData) => CategoryItem(title: categoryData.title, imageUrl: categoryData.imageUrl, id: categoryData.id  ,)).toList()
    );
  }
}