import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final_moviles/ventanas/Foto_perfil/icon.dart';
import 'package:proyecto_final_moviles/ventanas/Foto_perfil/icon_user.dart';

class Navegacion extends StatefulWidget {
  const Navegacion({super.key});

  @override
  State<Navegacion> createState() => _NavegacionState();
}

class _NavegacionState extends State<Navegacion> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 20,
          right: 20,
          child: GestureDetector(
            onTap: () {
              context.goNamed("perfil");
            },
            child: const IconoInicio2(),
          ),
        ),

        Positioned(
          top: 20,
          left: 20,
          child: GestureDetector(
            onTap: () {
              context.goNamed("Principal");
            },
            child: const IconoInicio(),
          ),
        ),
      ],
    );
  }
}
