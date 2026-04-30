import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final_moviles/ventanas/Foto_perfil/icon_user.dart';

class NavegacionBiblio extends StatefulWidget {
  const NavegacionBiblio({super.key});

  @override
  State<NavegacionBiblio> createState() => _NavegacionBiblioState();
}

class _NavegacionBiblioState extends State<NavegacionBiblio> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 20,
          left: 20,
          child: GestureDetector(
            onTap: () {
              context.goNamed("biblioteca");
            },
            child: const IconoInicio2(),
          ),
        ),
      ],
    );
  }
}
