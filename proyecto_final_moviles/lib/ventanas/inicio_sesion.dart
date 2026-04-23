import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class inicio_sesion extends StatefulWidget {
  const inicio_sesion({super.key});

  @override
  State<inicio_sesion> createState() => _inicio_sesionState();
  
}

class _inicio_sesionState extends State<inicio_sesion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Inicio de Sesión"),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Correo Electrónico",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Contraseña",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica de inicio de sesión aquí
              },
              child: Text("Iniciar Sesión"),
            ),
            Text(""),
            ElevatedButton(
              onPressed: () {
                context.goNamed("Registro");
                // Lógica de registro aquí
              },
              child: Text("Registrarse"),
            ),
          ],
        ),
      ),
    );
  }
}