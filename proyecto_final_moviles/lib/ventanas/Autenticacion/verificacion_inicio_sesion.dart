import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class VerificacionInicioSesion extends StatefulWidget {
  const VerificacionInicioSesion({super.key});

  @override
  State<VerificacionInicioSesion> createState() => _VerificacionInicioSesionState();
}

class _VerificacionInicioSesionState extends State<VerificacionInicioSesion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Verificación de Inicio de Sesión",
              style: TextStyle(
                fontSize: 40, // tamaño grande
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Aquí iría tu navegación, por ejemplo con go_router:
                context.goNamed("inicio_sesion");
              },
              child: const Text("Iniciar sesion"),
            ),
          ],
        ),
      ),
    );
  }
}
