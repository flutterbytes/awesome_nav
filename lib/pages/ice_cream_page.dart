import 'package:flutter/material.dart';

class IceCreamPage extends StatelessWidget {
  final Function onToggle;

  const IceCreamPage({Key key, this.onToggle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: onToggle,
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        title: Text("Ice Cream"),
      ),
      body: Center(
        child: Icon(
          Icons.icecream,
          color: Colors.green,
          size: 100,
        ),
      ),
    );
  }
}
