import 'package:flutter/material.dart';
import 'package:meal/screens/filters.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(String title, IconData icon, VoidCallback ontap) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: ontap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.red,
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Cooking Up!!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
          width: double.infinity,
        ),
        buildListTile('Meals', Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile('Filter', Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(Filters.routeName);
        }),
      ],
    );
  }
}
