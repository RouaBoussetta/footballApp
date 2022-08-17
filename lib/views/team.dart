import 'package:flutter/material.dart';

Widget team(String category, String logo, String name) {
  return Expanded(
    child: Column(
      children: [
        Text(
          category,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: Image.network(
            logo,
            width: 54.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ],
    ),
  );
}