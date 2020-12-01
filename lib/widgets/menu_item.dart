import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  final IconData icon;
  final String category;

  const MenuItems({Key key, this.icon, this.category}) : super(key: key);

  @override
  Widget build(Object context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.grey,
            size: 28,
          ),
          SizedBox(
            width: 24,
          ),
          Text(
            category,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
