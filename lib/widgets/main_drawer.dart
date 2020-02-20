import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String text, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 25),
      title: Text(text,
          style: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 22)),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).accentColor,
          alignment: Alignment.centerLeft,
          child: Text(
            'Cooking!',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        SizedBox(height: 20),
        buildListTile('Meals', Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile('Filters', Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        }),
      ],
    ));
  }
}
