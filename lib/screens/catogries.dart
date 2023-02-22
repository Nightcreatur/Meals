import 'package:flutter/material.dart';
import 'package:meal/widgets/catrgory_item.dart';
import 'package:meal/dummy_data.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: dummyCategory
            .map((catData) => CategoryItem(
                  color: catData.color,
                  title: catData.title,
                  id: catData.id,
                ))
            .toList(),
      ),
    );
  }
}
