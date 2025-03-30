import 'package:flutter/material.dart';

logo({required double fontSize}) => Hero(
      tag: 'logo',
      child: Material(
        color: Colors.transparent,
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
