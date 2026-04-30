import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/ventanas/Autenticacion/cierre_sesion.dart';

class BotonCierreSesion extends StatelessWidget {
  const BotonCierreSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      right: 12,
      child: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Cerrar Sesión"),
                content: const Text(
                  "¿Estás seguro de que deseas cerrar sesión?",
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancelar"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      cerrarSesion(context);
                    },
                    child: const Text(
                      "Cerrar Sesión",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              );
            },
          );
        },
        icon: const Icon(Icons.logout, color: Colors.white, size: 24),
        tooltip: "Cerrar Sesión",
      ),
    );
  }
}
