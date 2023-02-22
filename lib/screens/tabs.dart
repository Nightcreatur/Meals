import 'package:flutter/material.dart';
import 'package:meal/screens/catogries.dart';
import 'package:meal/screens/favorite.dart';
import 'package:meal/widgets/main_drawer.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Meals'),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Category',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favorite',
              )
            ]),
          ),
          body: const TabBarView(
            children: [Categories(), Favorite()],
          ),
          drawer: const Drawer(child: MainDrawer()),
        ));
  }
}
