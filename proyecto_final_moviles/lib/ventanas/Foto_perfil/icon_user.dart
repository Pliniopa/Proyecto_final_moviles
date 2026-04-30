import 'package:flutter/material.dart';

class IconoInicio2 extends StatelessWidget {
  final String imagen_1 = "assets/img/imagen2.png";

  const IconoInicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        imagen_1,
        width: 100, // tamaño visible
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}
