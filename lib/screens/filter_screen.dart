import 'package:flutter/material.dart';
import 'package:traveling/widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const screenRoute = 'FilterScreen';
  final Function saveFilters;
  final Map<String , bool> currentFilters;

  const FilterScreen({super.key, required this.saveFilters, required this.currentFilters});
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
   bool _summer = false;
   bool _winter = false;
   bool _family = false;

     @override
  initState() {
    _summer = widget.currentFilters['summer']!;
    _winter = widget.currentFilters['winter']!;
    _family = widget.currentFilters['family']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الفلترة',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'summer': _summer,
                  'winter': _winter,
                  'family': _family,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(context, 'الرحلات الصيفية',
                    'إظهار الرحلات الصيفية فقط.', _summer, (newValue) {
                  setState(() {
                    _summer = newValue;
                  });
                }),
                buildSwitchListTile(context, 'الرحلات الشتوية',
                    'إظهار الرحلات الشتوية فقط.', _winter, (newValue) {
                  setState(() {
                    _winter = newValue;
                  });
                }),
                buildSwitchListTile(context, 'الرحلات العائليه',
                    'إظهار الرحلات العائليه فقط.', _family, (newValue) {
                  setState(() {
                    _family = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(BuildContext context, String title,
      String subTitle, bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      subtitle: Text(
        subTitle,
      ),
      value: currentValue,
      onChanged: updateValue,
    );
  }
}
