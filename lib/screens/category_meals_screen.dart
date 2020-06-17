import 'package:flutter/material.dart';
import 'package:recipe_app/dummy_data.dart';
import 'package:recipe_app/models/meal.dart';
import 'package:recipe_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {

  //Using routes these values will passing by arguments
  /*final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen(this.categoryId, this.categoryTitle);*/

  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void initState() {

    //ERROR because the initState run before the context object be loaded. so we have to put these
    //commands below in didChangeDependecies()
    /*final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    categoryTitle = routeArgs['title'];
    displayedMeals = DUMMY_MEALS.where((meal) => meal.categories.contains(categoryId)).toList();*/
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    categoryTitle = routeArgs['title'];
    displayedMeals = DUMMY_MEALS.where((meal) => meal.categories.contains(categoryId)).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),),
      body: ListView.builder(itemBuilder: (ctx, index){
        return MealItem(
          id: displayedMeals[index].id,
          title: displayedMeals[index].title,
          imageUrl: displayedMeals[index].imageUrl,
          duration: displayedMeals[index].duration,
          affordability: displayedMeals[index].affordability,
          complexity: displayedMeals[index].complexity,
          removeItem: _removeMeal,
        );
      }, itemCount: displayedMeals.length,),
    );
  }
}
