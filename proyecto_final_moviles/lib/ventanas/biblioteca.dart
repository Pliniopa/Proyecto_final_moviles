import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/rutas/nav.dart';
import 'package:proyecto_final_moviles/temas/dia.dart';
import 'package:proyecto_final_moviles/temas/noche.dart';
import 'package:proyecto_final_moviles/temas/nocturna.dart';
import 'package:proyecto_final_moviles/servicios/servicios.dart';

class Biblioteca extends StatefulWidget {
  const Biblioteca({super.key});

  @override
  State<Biblioteca> createState() => _BibliotecaState();
}

class _BibliotecaState extends State<Biblioteca> {
  final ThemeService _themeService = ThemeService();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _themeService.modoOscuro ? temaNoche : temaDia,
      child: Scaffold(
        body: Stack(
          children: [
            const Center(
              child: Text(
                "Bibioteca",
                style: TextStyle(fontSize: 24),
              ),
            ),
            const navegacion(),
            BotonLuna(
              onToggle: (isDark) {
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
