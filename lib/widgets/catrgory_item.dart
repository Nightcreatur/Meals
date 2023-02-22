import 'package:flutter/material.dart';
import 'package:meal/screens/category_meals.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.color, required this.title, required this.id});
  final Color color;
  final String title;
  final String id;
  void selectedCategories(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMeals.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: (() => selectedCategories(context)),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Text(title, style: Theme.of(context).textTheme.bodyText1),
      ),
    );
  }
}
