import 'package:flutter/material.dart';
import 'file:///C:/_apps/flutter/recipe_app/lib/widgets/category_item.dart';
import 'package:recipe_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   /* return Scaffold(
      appBar: AppBar(
        title: const Text("Family Recipes"),
      ),
      body:*/
    return GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((e) => CategoryItem(e.id, e.title, e.color)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
    );
  }
}
