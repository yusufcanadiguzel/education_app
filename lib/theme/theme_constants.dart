import 'package:flutter/material.dart';

const Color _backgroundColor = Color(0xFF1D3566);

final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: const Color(0xFF0F1334),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF111639),
      selectedItemColor: Colors.white,
      unselectedItemColor: Color(0xFFBDBECA),
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      color: Color(0xFF12163A),
    ),
    buttonTheme: const ButtonThemeData(
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(1.0),
      )),
      buttonColor: _backgroundColor,
      textTheme: ButtonTextTheme.primary,
    ));

final ThemeData darkTheme = ThemeData.dark().copyWith(
    buttonTheme: const ButtonThemeData(
  shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.all(
    Radius.circular(1000.0),
  )),
  buttonColor: _backgroundColor,
  textTheme: ButtonTextTheme.primary,
));

final InputDecoration kTextFormFieldDecoration = InputDecoration(
  labelStyle: const TextStyle(color: Colors.white),
  hintStyle: const TextStyle(color: Colors.white),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.white,
        width: 3.0,
      )),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
      width: 3.0,
    ),
  ),
);
