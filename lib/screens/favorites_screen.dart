import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          'You don\'t have any favorites yet!',
          style: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 25),
        ),
      );
    } else {
      return ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              meal: favoriteMeals[index],
            );
          },
          itemCount: favoriteMeals.length);
    }
    ;
  }
}
