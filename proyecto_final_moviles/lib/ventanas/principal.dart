import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/rutas/nav.dart';
import 'package:proyecto_final_moviles/rutas/nav_biblio.dart';
import 'package:proyecto_final_moviles/temas/dia.dart';
import 'package:proyecto_final_moviles/temas/noche.dart';
import 'package:proyecto_final_moviles/temas/nocturna.dart';
import 'package:proyecto_final_moviles/servicios/servicios.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
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
                "Pantalla Principal",
                style: TextStyle(fontSize: 24),
              ),
            ),
            const navegacion(),
            navegacion_biblio(),
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
