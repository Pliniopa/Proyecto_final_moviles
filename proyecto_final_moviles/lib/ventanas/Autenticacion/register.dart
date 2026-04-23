import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/ventanas/Foto_perfil/icon.dart';
import 'package:go_router/go_router.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Declaramos el controlador aquí
  final TextEditingController _fechaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Registro"),
            const SizedBox(height: 20),
            const IconoInicio(),
            const SizedBox(height: 20),

            TextField(
              decoration: const InputDecoration(
                labelText: "Nombre",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _fechaController,
              readOnly: true, // evita que el usuario escriba
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
                  // Aquí sí se asigna al campo
                  _fechaController.text =
                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                }
              },
            ),
            const SizedBox(height: 20),

            TextField(
              decoration: const InputDecoration(
                labelText: "Correo Electrónico",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Contraseña",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
                onPressed: () {
                context.goNamed("VerificacionInicioSesion");
                // Lógica de registro aquí
              },
              child: const Text("Registrarse"),
              
            ),
          ],
        ),
      ),
    );
  }
}
