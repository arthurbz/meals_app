import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  void _removeItem(String deleteThisMealID) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == deleteThisMealID);
    });
  }

  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArguments =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArguments['title'];
      final categoryID = routeArguments['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryID);
      }).toList();
      _loadedInitData = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              meal: displayedMeals[index],
            );
          },
          itemCount: displayedMeals.length),
    );
  }
}
