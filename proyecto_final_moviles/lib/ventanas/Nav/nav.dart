import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final_moviles/ventanas/Foto_perfil/icon.dart';
import 'package:proyecto_final_moviles/ventanas/Foto_perfil/icon_user.dart';



class navegacion extends StatefulWidget {
  const navegacion({super.key});

  @override
  State<navegacion> createState() => _navegacionState();
}

class _navegacionState extends State<navegacion> {
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
                  child: IconoInicio2(),
                  ),
                
              ),
        
        Positioned(
                top: 20,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    context.goNamed("Principal");
                  },
                  child: IconoInicio(),
                  ),
                
              )

        
      ]);
    
    
     
      
    
  }
}
