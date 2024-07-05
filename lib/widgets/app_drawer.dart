import 'package:flutter/material.dart';
import 'package:traveling/screens/filter_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100.0,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40.0),
            alignment: Alignment.center,
            color: Colors.blueAccent,
            child: Text(
              'دليلك السياحي',
              style: Theme.of(context).textTheme.headlineLarge,
              ),
          ),
          const SizedBox(height: 20.0,),
         buildListTile(
          context,
           'الرحلات' ,
           Icons.card_travel, () {
          Navigator.of(context).pushReplacementNamed('/');
         },),
         buildListTile(context, 'الفلترة' ,Icons.filter_list_rounded, () {
          Navigator.of(context).pushReplacementNamed(FilterScreen.screenRoute);
         },),
        ],
      ),
    );
  }

  ListTile buildListTile(BuildContext context, String title, IconData icon, Function onTapLink) {
    return ListTile(
          leading: Icon(icon, size: 30.0, color: Colors.amber,),
          title: Text(title, style: Theme.of(context).textTheme.headlineMedium,),
          onTap: () {
            onTapLink();
          },
        );
  }
}