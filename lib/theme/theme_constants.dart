import 'package:flutter/material.dart';
import 'package:education_app/constants/colors.dart' as kcolors;

const Color _backgroundColor = Color(0xFF1D3566);

final ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: _backgroundColor,
  buttonTheme: const ButtonThemeData(
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(1.0),)
    ),
    buttonColor: _backgroundColor,
    textTheme: ButtonTextTheme.primary,
  )
);

final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: _backgroundColor,
    buttonTheme: const ButtonThemeData(
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(1000.0),)
      ),
      buttonColor: _backgroundColor,
      textTheme: ButtonTextTheme.primary,
    )
);

final InputDecoration kTextFormFieldDecoration = InputDecoration(
  labelStyle: const TextStyle(color: Colors.white),
  hintStyle: const TextStyle(color: Colors.white),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(
      color: Colors.white,
      width: 3.0,
    )
  ),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
      width: 3.0,
    ),
  ),
);