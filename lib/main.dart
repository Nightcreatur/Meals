import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
import 'package:meal/screens/category_meals.dart';
import 'package:meal/screens/filters.dart';
import 'package:meal/screens/meal_detail.dart';
import 'package:meal/screens/tabs.dart';

import 'models/meal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  // void setFilter(Map<String, bool> filterData) {
  //   setState(() {
  //     filter = filterData;
  //     availableMeals = dummyMeals.where((meal) {}).toList();
  //   });
  // }

  List<Meal> availableMeals = dummyMeals;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromARGB(255, 16, 40, 40),
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Tabs(),
        CategoryMeals.routeName: (context) => CategoryMeals(),
        MealDeatil.routeName: (context) => const MealDeatil(),
        Filters.routeName: (context) => Filters(),
      },
    );
  }
}
