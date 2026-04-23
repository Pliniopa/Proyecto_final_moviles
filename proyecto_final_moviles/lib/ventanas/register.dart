import 'package:flutter/material.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
  
}
class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Registro"),
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