import 'package:flutter/material.dart';

final ThemeData temaDia = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: const Color.fromARGB(255, 154, 148, 148),
  textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white, // fondo claro para los campos
    labelStyle: const TextStyle(color: Colors.black),
    hintStyle: const TextStyle(color: Colors.black54),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.black54),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.blue),
    ),
  ),
);
