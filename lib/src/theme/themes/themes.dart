import 'package:flutter/material.dart';

//const color = const Color(0xff6f66d8);

final roundedButtonStyle = ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
);

final cardTheme = CardTheme(
  color: Colors.white54,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
);

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
);

const inputDecorationTheme = InputDecorationTheme(
  labelStyle: TextStyle(color: Colors.blue),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
  ),
);

final alertBoxTheme = DialogTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)));

//const cardFont = Font
