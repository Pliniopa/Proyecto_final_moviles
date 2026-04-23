import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/ventanas/Foto_perfil/icon.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final_moviles/ventanas/Nav/nav.dart';



class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: Text(
              "Pantalla Principal",
              style: TextStyle(fontSize: 24),
            ),
          ),
            const navegacion(),
        ],
      ),
    );
  }
}
