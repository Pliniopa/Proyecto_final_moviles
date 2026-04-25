import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/servicios/login_usuario.dart';
import 'package:proyecto_final_moviles/ventanas/Foto_perfil/icon.dart';
import 'package:go_router/go_router.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();

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
              "Registro",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const IconoInicio(),
            const SizedBox(height: 20),

            // Nombre
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(
                labelText: "Nombre",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Fecha de nacimiento
            TextField(
              controller: _fechaController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: "Fecha de Nacimiento",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  _fechaController.text =
                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                }
              },
            ),
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

            // Botón de registro
            ElevatedButton(
              onPressed: () async {
                String usuario = _userController.text.trim();
                String passwd = _passwordController.text.trim();
                String nombre = _nombreController.text.trim();
                String fechaNacimiento = _fechaController.text.trim();

                // Llamada al servicio de registro
                final response = await registrarUsuario(
                  usuario,
                  passwd,
                  nombre,
                  fechaNacimiento,
                );

                // ✅ Bloque corregido
                if (response.containsKey("status") &&
                    response["status"] == "success") {
                  context.goNamed("inicio_sesion");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Error en el registro: ${response["message"] ?? "Intenta nuevamente"}",
                      ),
                    ),
                  );
                }
              },
              child: const Text("Registrarse"),
            ),
          ],
        ),
      ),
    );
  }
}
