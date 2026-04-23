import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/rutas/nav.dart';
import 'package:proyecto_final_moviles/temas/dia.dart';
import 'package:proyecto_final_moviles/temas/noche.dart';
import 'package:proyecto_final_moviles/temas/nocturna.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  bool modoAlternativo = false; // controla si es día o noche

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: modoAlternativo ? temaNoche : temaDia,
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
            BotonLuna(
              onPressed: () {
                setState(() {
                  modoAlternativo = !modoAlternativo;
                });
                debugPrint("Botón luna presionado, modo: $modoAlternativo");
              },
            ),
          ],
        ),
      ),
    );
  }
}
