import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final_moviles/ventanas/Foto_perfil/icon_user.dart';



class navegacion_biblio extends StatefulWidget {
  const navegacion_biblio({super.key});

  @override
  State<navegacion_biblio> createState() => _navegacion_biblioState();
}

class _navegacion_biblioState extends State<navegacion_biblio> {
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
                  child: IconoInicio2(),
                  ),
                
              ),
        
      ]);
  }
}
