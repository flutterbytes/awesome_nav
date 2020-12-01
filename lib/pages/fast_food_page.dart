import 'package:flutter/material.dart';

class FastFoodPage extends StatelessWidget {
  final Function onToggle;

  const FastFoodPage({Key key, this.onToggle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Fast Food"),
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
          Icons.fastfood,
          color: Colors.red,
          size: 100,
        ),
      ),
    );
  }
}
