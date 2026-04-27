import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/rutas/nav.dart';
import 'package:proyecto_final_moviles/temas/dia.dart';
import 'package:proyecto_final_moviles/temas/noche.dart';
import 'package:proyecto_final_moviles/temas/nocturna.dart';
import 'package:proyecto_final_moviles/servicios/servicios.dart';

class Biblioteca extends StatefulWidget {
  const Biblioteca({super.key});

  @override
  State<Biblioteca> createState() => _BibliotecaState();
}

class _BibliotecaState extends State<Biblioteca> {
  final ThemeService _themeService = ThemeService();

  // Ajusta bloques_lat al tamaño real de la lista
  int bloques_lat = 8;

  // Lista con información de cada bloque (imagen + título + descripción)
  final List<Map<String, String>> bloquesInfo = [
    {
      "titulo": "Libro A",
      "descripcion": "Información del Libro A",
      "imagen": "../assets/img/imagen1.png",
    },
    {
      "titulo": "Libro B",
      "descripcion": "Información del Libro B",
      "imagen": "../assets/img/imagen2.png",
    },
    {
      "titulo": "Libro C",
      "descripcion": "Información del Libro C",
      "imagen": "../assets/img/imagen3.png",
    },
    {
      "titulo": "Libro D",
      "descripcion": "Información del Libro D",
      "imagen": "../assets/img/imagen4.png",
    },
    {
      "titulo": "Libro E",
      "descripcion": "Información del Libro E",
      "imagen": "../assets/img/imagen5.png",
    },
    {
      "titulo": "Libro F",
      "descripcion": "Información del Libro F",
      "imagen": "../assets/img/imagen6.png",
    },
    {
      "titulo": "Libro G",
      "descripcion": "Información del Libro G",
      "imagen": "../assets/img/imagen7.png",
    },
    {
      "titulo": "Libro H",
      "descripcion": "Información del Libro H",
      "imagen": "../assets/img/imagen8.png",
    },
  ];

  final List<Map<String, String>> bloquesInfo2 = [
    {
      "titulo": "Libro A",
      "descripcion": "Información del Libro A",
      "imagen": "../assets/img/imagen8.png",
    },
    {
      "titulo": "Libro B",
      "descripcion": "Información del Libro B",
      "imagen": "../assets/img/imagen7.png",
    },
    {
      "titulo": "Libro C",
      "descripcion": "Información del Libro C",
      "imagen": "../assets/img/imagen6.png",
    },
    {
      "titulo": "Libro D",
      "descripcion": "Información del Libro D",
      "imagen": "../assets/img/imagen5.png",
    },
    {
      "titulo": "Libro E",
      "descripcion": "Información del Libro E",
      "imagen": "../assets/img/imagen4.png",
    },
    {
      "titulo": "Libro F",
      "descripcion": "Información del Libro F",
      "imagen": "../assets/img/imagen3.png",
    },
    {
      "titulo": "Libro G",
      "descripcion": "Información del Libro G",
      "imagen": "../assets/img/imagen2.png",
    },
    {
      "titulo": "Libro H",
      "descripcion": "Información del Libro H",
      "imagen": "../assets/img/imagen1.png",
    },
  ];

  final List<Map<String, String>> bloquesInfo3 = [
    {
      "titulo": "Libro A",
      "descripcion": "Información del Libro A",
      "imagen": "../assets/img/imagen5.png",
    },
    {
      "titulo": "Libro B",
      "descripcion": "Información del Libro B",
      "imagen": "../assets/img/imagen6.png",
    },
    {
      "titulo": "Libro C",
      "descripcion": "Información del Libro C",
      "imagen": "../assets/img/imagen7.png",
    },
    {
      "titulo": "Libro D",
      "descripcion": "Información del Libro D",
      "imagen": "../assets/img/imagen8.png",
    },
    {
      "titulo": "Libro E",
      "descripcion": "Información del Libro E",
      "imagen": "../assets/img/imagen1.png",
    },
    {
      "titulo": "Libro F",
      "descripcion": "Información del Libro F",
      "imagen": "../assets/img/imagen2.png",
    },
    {
      "titulo": "Libro G",
      "descripcion": "Información del Libro G",
      "imagen": "../assets/img/imagen3.png",
    },
    {
      "titulo": "Libro H",
      "descripcion": "Información del Libro H",
      "imagen": "../assets/img/imagen4.png",
    },
  ];

  final List<Map<String, String>> bloquesInfo4 = [
    {
      "titulo": "Libro A",
      "descripcion": "Información del Libro A",
      "imagen": "../assets/img/imagen5.png",
    },
    {
      "titulo": "Libro B",
      "descripcion": "Información del Libro B",
      "imagen": "../assets/img/imagen4.png",
    },
    {
      "titulo": "Libro C",
      "descripcion": "Información del Libro C",
      "imagen": "../assets/img/imagen3.png",
    },
    {
      "titulo": "Libro D",
      "descripcion": "Información del Libro D",
      "imagen": "../assets/img/imagen2.png",
    },
    {
      "titulo": "Libro E",
      "descripcion": "Información del Libro E",
      "imagen": "../assets/img/imagen1.png",
    },
    {
      "titulo": "Libro F",
      "descripcion": "Información del Libro F",
      "imagen": "../assets/img/imagen6.png",
    },
    {
      "titulo": "Libro G",
      "descripcion": "Información del Libro G",
      "imagen": "../assets/img/imagen7.png",
    },
    {
      "titulo": "Libro H",
      "descripcion": "Información del Libro H",
      "imagen": "../assets/img/imagen8.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _themeService.modoOscuro ? temaNoche : temaDia,
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text("Biblioteca", style: TextStyle(fontSize: 24)),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(bloquesInfo.length, (index) {
                        final bloque = bloquesInfo[index];

                        return GestureDetector(
                          onTap: () {
                            // Al presionar, redirige a la ventana de detalle
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetalleBloque(
                                  titulo: bloque["titulo"] ?? "Sin título",
                                  descripcion:
                                      bloque["descripcion"] ??
                                      "Sin descripción",
                                  imagen:
                                      bloque["imagen"] ??
                                      "assets/img/default.png",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 150,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue[100 * ((index % 8) + 1)],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            // Mostrar imagen y título dentro del bloque
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    bloque["imagen"] ??
                                        "assets/img/default.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  bloque["titulo"] ?? "Sin título",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(bloquesInfo2.length, (index) {
                        final bloque = bloquesInfo2[index];

                        return GestureDetector(
                          onTap: () {
                            // Al presionar, redirige a la ventana de detalle
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetalleBloque(
                                  titulo: bloque["titulo"] ?? "Sin título",
                                  descripcion:
                                      bloque["descripcion"] ??
                                      "Sin descripción",
                                  imagen:
                                      bloque["imagen"] ??
                                      "assets/img/default.png",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 150,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue[100 * ((index % 8) + 1)],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            // Mostrar imagen y título dentro del bloque
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    bloque["imagen"] ??
                                        "assets/img/default.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  bloque["titulo"] ?? "Sin título",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(bloquesInfo3.length, (index) {
                        final bloque = bloquesInfo3[index];

                        return GestureDetector(
                          onTap: () {
                            // Al presionar, redirige a la ventana de detalle
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetalleBloque(
                                  titulo: bloque["titulo"] ?? "Sin título",
                                  descripcion:
                                      bloque["descripcion"] ??
                                      "Sin descripción",
                                  imagen:
                                      bloque["imagen"] ??
                                      "assets/img/default.png",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 150,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue[100 * ((index % 8) + 1)],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            // Mostrar imagen y título dentro del bloque
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    bloque["imagen"] ??
                                        "assets/img/default.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  bloque["titulo"] ?? "Sin título",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(bloquesInfo4.length, (index) {
                        final bloque = bloquesInfo4[index];

                        return GestureDetector(
                          onTap: () {
                            // Al presionar, redirige a la ventana de detalle
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetalleBloque(
                                  titulo: bloque["titulo"] ?? "Sin título",
                                  descripcion:
                                      bloque["descripcion"] ??
                                      "Sin descripción",
                                  imagen:
                                      bloque["imagen"] ??
                                      "assets/img/default.png",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 150,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue[100 * ((index % 8) + 1)],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            // Mostrar imagen y título dentro del bloque
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    bloque["imagen"] ??
                                        "assets/img/default.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  bloque["titulo"] ?? "Sin título",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            const navegacion(),

            BotonLuna(onToggle: (isDark) => setState(() {})),
          ],
        ),
      ),
    );
  }
}

// Ventana de detalle que muestra título, descripción e imagen
class DetalleBloque extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final String imagen;

  const DetalleBloque({
    super.key,
    required this.titulo,
    required this.descripcion,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagen, width: 200, height: 200, fit: BoxFit.cover),
          const SizedBox(height: 20),
          Text(descripcion, style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
