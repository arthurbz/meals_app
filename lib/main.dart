import 'package:flutter/material.dart';

import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MealsApp());

class MealsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.lightGreen,
        canvasColor: Color.fromRGBO(255, 245, 250, 1),
        textTheme: ThemeData.dark().textTheme.copyWith(
            body1: TextStyle(color: Color.fromRGBO(30, 35, 55, 1)),
            body2: TextStyle(color: Color.fromRGBO(30, 35, 55, 1)),
            title: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) =>  CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      }
    );
  }
}
