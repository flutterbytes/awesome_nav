import 'package:flutter/material.dart';

class CoffeePage extends StatelessWidget {
  final Function onToggle;

  const CoffeePage({Key key, this.onToggle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Coffee and drinks"),
        leading: IconButton(
          onPressed: onToggle,
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Icon(
          Icons.emoji_food_beverage,
          color: Colors.brown,
          size: 100,
        ),
      ),
    );
  }
}
