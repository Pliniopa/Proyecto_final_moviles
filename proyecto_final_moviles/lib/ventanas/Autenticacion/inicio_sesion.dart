import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final_moviles/servicios/login_usuario.dart';
import 'package:proyecto_final_moviles/ventanas/Foto_perfil/icon.dart';

class InicioSesion extends StatefulWidget {
  const InicioSesion({super.key});

  @override
  State<InicioSesion> createState() => _InicioSesionState();
}

class _InicioSesionState extends State<InicioSesion> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Inicio de Sesión",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const IconoInicio(),
            const SizedBox(height: 20),

            // Correo electrónico
            TextField(
              controller: _userController,
              decoration: const InputDecoration(
                labelText: "Correo Electrónico",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Contraseña
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Contraseña",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Botón iniciar sesión
            ElevatedButton(
              onPressed: () async {
                String usuario = _userController.text.trim();
                String contrasena = _passwordController.text.trim();

                if (usuario.isEmpty || contrasena.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Por favor completa todos los campos")),
                  );
                  return;
                }

                // Llamar al servicio de login
                final response = await loginUsuario(usuario, contrasena);

                if (response.containsKey("status") &&
                    response["status"] == "success") {
                  context.goNamed("Principal");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        response["message"] ?? "Credenciales inválidas",
                      ),
                    ),
                  );
                }
              },
              child: const Text("Iniciar Sesión"),
            ),
            const SizedBox(height: 20),

            // Botón registro
            ElevatedButton(
              onPressed: () {
                context.goNamed("Registro");
              },
              child: const Text("Registrarse"),
            ),
          ],
        ),
      ),
    );
  }
}
