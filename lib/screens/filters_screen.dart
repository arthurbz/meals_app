import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> filters;
  final Function saveFilters;

  FiltersScreen(this.filters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isVegeterian = false;
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegan = false;

  @override
  initState() {
    _isLactoseFree = widget.filters['lactose'];
    _isVegan = widget.filters['vegan'];
    _isVegeterian = widget.filters['vegetarian'];
    _isGlutenFree = widget.filters['gluten'];
    super.initState();
  }

  Widget _buildSwitchTile(String title, String description,
      Function updateValue, bool currentValue) {
    return SwitchListTile(
      value: currentValue,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      subtitle: Text(description,
          style: TextStyle(
            color: Colors.grey,
          )),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _isGlutenFree,
                'vegan': _isVegan,
                'vegetarian': _isVegeterian,
                'lactose': _isLactoseFree,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            child: Text('Adjust your filters', style: TextStyle(fontSize: 20)),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile(
                    'Gluten-free', 'Only include gluten-free meals.',
                    (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                }, _isGlutenFree),
                _buildSwitchTile('Vegetarian', 'Only include vegetarian meals.',
                    (newValue) {
                  setState(() {
                    _isVegeterian = newValue;
                  });
                }, _isVegeterian),
                _buildSwitchTile('Vegan', 'Only include vegan meals.',
                    (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                }, _isVegan),
                _buildSwitchTile(
                    'Lactose-free', 'Only include lactose-free meals.',
                    (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                }, _isLactoseFree),
              ],
            ),
          )
        ],
      ),
    );
  }
}
