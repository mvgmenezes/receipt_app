import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filtes';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree= false;
  var _vegetarianFree= false;
  var _vegan= false;
  var _lactoseFree= false;

  Widget _buildSwitchListTile(String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: updateValue
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters'),),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text('Adjust your meal selection', style: Theme.of(context).textTheme.headline6,),
        ),
        Expanded(
          child: ListView(children: <Widget>[
            _buildSwitchListTile(
                'Gluten-free',
                'Only include gluten-free meals',
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }
            ),
            _buildSwitchListTile(
                'Vegetarian',
                'Only include vegetarian meals',
                _vegetarianFree,
                    (newValue) {
                  setState(() {
                    _vegetarianFree = newValue;
                  });
                }
            ),
            _buildSwitchListTile(
                'Vegan',
                'Only include vegan meals',
                _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }
            ),
            _buildSwitchListTile(
                'Lactose-free',
                'Only include Lactose-free meals',
                _lactoseFree,
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }
            ),
          ],),
        )
      ],)
    );
  }
}
