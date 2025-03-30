import 'package:flutter/material.dart';

logo({required double fontSize}) => Hero(
      tag: 'logo',
      child: Material(
        child: Text(
          'Vordic',
          style: TextStyle(
            fontFamily: 'Dejavu',
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
