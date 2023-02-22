import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
import 'package:meal/widgets/meals_item.dart';

class CategoryMeals extends StatelessWidget {
  const CategoryMeals({super.key});
  static const routeName = '/categoryMeals';
  // const CategoryMeals(this.id, this.title, {super.key});
  // final String id;
  // final String title;

  @override
  Widget build(BuildContext context) {
    final routesArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final catTitle = routesArg['title'];
    final catId = routesArg['id'];
    final categoryMeals = dummyMeals.where((meals) {
      return meals.categories.contains(catId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
            title: Text(
          catTitle!,
        )),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
