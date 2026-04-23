import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final_moviles/ventanas/Foto_perfil/icon.dart';

class inicio_sesion extends StatefulWidget {
  const inicio_sesion({super.key});

  @override
  State<inicio_sesion> createState() => _inicio_sesionState();
  
}

class _inicio_sesionState extends State<inicio_sesion> {

final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Inicio de Sesión"),
            Text(""),
            Container(
              width: 100,
              height: 100,
              child: IconoInicio(),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Correo Electrónico",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Contraseña",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_passwordController == _passwordController){
                  context.goNamed("Principal");
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Por favor, ingresa una contraseña para registrarte."))
                  );
                }
                
                // Lógica de inicio de sesión aquí
              },
              child: Text("Iniciar Sesión"),
            ),
            SizedBox(height: 20),

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