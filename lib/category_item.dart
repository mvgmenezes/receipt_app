import 'package:flutter/material.dart';
import 'package:recipe_app/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);
  
  void selectedCategory(BuildContext ctx){
    //using routes to call and changing to passing parameters in the route
    /*Navigator.of(ctx).push(MaterialPageRoute(
      builder: (_) {
        return CategoryMealsScreen(id, title);
      }
    )*/
    Navigator.of(ctx).pushNamed(
        '/category-meals',
        arguments: {
          'id': id,
          'title': title,
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.headline6,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}
