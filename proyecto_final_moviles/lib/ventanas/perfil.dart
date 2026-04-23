import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/rutas/nav.dart';
import 'package:proyecto_final_moviles/temas/dia.dart';
import 'package:proyecto_final_moviles/temas/noche.dart';
import 'package:proyecto_final_moviles/temas/nocturna.dart';


class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

    bool modoAlternativo = false; // controla si es día o noche


  @override
  Widget build(BuildContext context) {
    return Theme(
    data: modoAlternativo ? temaNoche : temaDia,
     child: Scaffold(
      body: Stack(
        children: [
        const Center(
        child: Text("Contenido del Perfil", 
        style: TextStyle(fontSize: 24)),
        
      ),

      const navegacion(),

      Positioned(
         top: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Perfil",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold, 
                )
                )
                )
                ),

        BotonLuna(
            onPressed: () {
              setState(() {
                  modoAlternativo = !modoAlternativo;
                });
              // Aquí puedes manejar el cambio de tema o cualquier acción
                debugPrint("Botón luna presionado, modo: $modoAlternativo");
            },
          ),
        ]
     
    )
    )
    );
    
    
  }
}
