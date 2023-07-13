import 'package:ag_appointment/src/theme/themes/themes.dart';
import 'package:flutter/material.dart' show Colors, ThemeData, VisualDensity;

ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.compact,
      cardTheme: cardTheme,
      elevatedButtonTheme: elevatedButtonTheme,
      inputDecorationTheme: inputDecorationTheme,
      dialogTheme: alertBoxTheme,
    );
