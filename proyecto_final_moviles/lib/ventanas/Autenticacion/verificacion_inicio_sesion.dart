import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final_moviles/temas/estilo_tintero.dart';

class VerificacionInicioSesion extends StatelessWidget {
  const VerificacionInicioSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TinteroBackground(
        image: fondoInicio,
        opacity: 0.58,
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TinteroLogo(width: 170),
                  const SizedBox(height: 44),
                  const Text(
                    "Usuario Registrado con Éxito",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 46),
                  TinteroButton(
                    text: "Iniciar sesion",
                    width: 260,
                    onPressed: () => context.goNamed("inicio_sesion"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
