import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';

class MealDeatil extends StatelessWidget {
  const MealDeatil({super.key});
  static const routeName = '/meal-detail';

  Widget buildSectioinTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 250,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere(
      (meal) => meal.id == mealId,
    );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 127, 127),
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectioinTitle(context, 'Ingredients'),
          buildContainer(
            ListView.builder(
              itemBuilder: (context, index) =>
                  Card(child: Text(selectedMeal.ingredients[index])),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
          const Divider(
            thickness: 1.5,
            color: Colors.white,
          ),
          buildSectioinTitle(context, 'Steps'),
          buildContainer(ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                child: Text('# ${(index + 1)}'),
              ),
              title: Text(selectedMeal.steps[index]),
            ),
            itemCount: selectedMeal.steps.length,
          )),
        ]),
      ),
    );
  }
}
