import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/ventanas/Autenticacion/cierre_sesion.dart';
import 'package:go_router/go_router.dart';

class BotonCierreSesion extends StatelessWidget {
  const BotonCierreSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Cerrar Sesión"),
                    content: const Text("¿Estás seguro de que deseas cerrar sesión?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Solo cerrar el diálogo
                        },
                        child: const Text("Cancelar"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Cerrar el diálogo
                          cerrarSesion(context); // Limpiar sesión
                          context.goNamed("inicio_sesion"); // Redirigir al login
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
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
              size: 24,
            ),
            tooltip: "Cerrar Sesión",
          ),
        ),
      ),
    );
  }
}
