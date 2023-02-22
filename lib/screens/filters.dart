import 'package:flutter/material.dart';
import 'package:meal/widgets/main_drawer.dart';

class Filters extends StatefulWidget {
  // final VoidCallback saveFilter;
  // const Filters({super.key, required this.saveFilter});

  static const routeName = '/filters';

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  Widget buildSwitchListTile(
      String title, bool currentValue, Function(bool value) updatedValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: updatedValue,
    );
  }

  bool glutenFree = false;
  bool vegan = false;
  bool lactosFree = false;
  bool vegetarian = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [IconButton(onPressed: null, icon: const Icon(Icons.save))],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Adjust your meal selection',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile('Gluten Free', glutenFree, (value) {
                setState(() {
                  glutenFree = value;
                });
              }),
              buildSwitchListTile(
                'Vegan',
                vegan,
                (value) {
                  setState(() {
                    vegan = value;
                  });
                },
              ),
              buildSwitchListTile(
                'Vegetarian',
                vegetarian,
                (value) {
                  setState(() {
                    vegetarian = value;
                  });
                },
              ),
              buildSwitchListTile(
                'Lactos Free',
                lactosFree,
                (value) {
                  setState(() {
                    lactosFree = value;
                  });
                },
              ),
            ],
          ))
        ],
      ),
      drawer: const Drawer(
        child: MainDrawer(),
      ),
    );
  }
}
