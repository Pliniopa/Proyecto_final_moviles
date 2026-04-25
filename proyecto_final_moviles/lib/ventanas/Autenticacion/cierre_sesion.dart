import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

/// Función para cerrar la sesión del usuario
/// Navega de vuelta a la pantalla de inicio de sesión
Future<void> cerrarSesion(BuildContext context) async {
  try {
    // Aquí puedes agregar lógica adicional como:
    // - Limpiar variables de sesión
    // - Eliminar tokens almacenados
    // - Cerrar conexiones de base de datos, etc.
    
    print("✅ Sesión cerrada correctamente");
    
    // Navegar a la pantalla de inicio de sesión
    if (context.mounted) {
      context.goNamed("InicioSesion");
    }
  } catch (e) {
    print("❌ Error al cerrar sesión: $e");
  }
}
