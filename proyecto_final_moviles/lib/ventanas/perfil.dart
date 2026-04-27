import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/rutas/nav.dart';
import 'package:proyecto_final_moviles/servicios/servicios.dart';
import 'package:proyecto_final_moviles/temas/dia.dart';
import 'package:proyecto_final_moviles/temas/noche.dart';
import 'package:proyecto_final_moviles/temas/nocturna.dart';
import 'package:proyecto_final_moviles/ventanas/Foto_perfil/boton_cierre.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final ThemeService _themeService = ThemeService();

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _themeService.modoOscuro ? temaNoche : temaDia,

      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Imagen de perfil
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: const AssetImage("assets/perfil.png"),
                    ),
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

                    // Cambiar contraseña
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Nueva Contraseña",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Botón guardar cambios
                    ElevatedButton(
                      onPressed: () {
                        // Aquí llamas a tu servicio Supabase para actualizar datos
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Cambios guardados")),
                        );
                      },
                      child: const Text("Guardar Cambios"),
                    ),
                  ],
                ),
              ),
            ),

            // Navegación
            const navegacion(),

            // Título superior
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: const Center(
                child: Text(
                  "Perfil",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Botón luna
            BotonLuna(
              onToggle: (estado) {
                setState(() {
                  _themeService.setModoOscuro(estado);
                });
              },
            ),

            // Botón cierre de sesión
            const BotonCierreSesion(),
          ],
        ),
      ),
    );
  }
}
