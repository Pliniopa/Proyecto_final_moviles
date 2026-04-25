import 'package:flutter/material.dart';

class IconoInicio extends StatelessWidget {
  final String imagen_1 = "../assets/img/imagen_corporativa.png";

  const IconoInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        imagen_1,
        width: 100,   // tamaño visible
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}
