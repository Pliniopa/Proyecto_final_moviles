

import 'package:go_router/go_router.dart';
import 'package:proyecto_final_moviles/ventanas/biblioteca.dart';
import 'package:proyecto_final_moviles/ventanas/Autenticacion/inicio_sesion.dart';
import 'package:proyecto_final_moviles/ventanas/perfil.dart';
import 'package:proyecto_final_moviles/ventanas/principal.dart';
import 'package:proyecto_final_moviles/ventanas/Autenticacion/register.dart';
import 'package:proyecto_final_moviles/ventanas/Autenticacion/verificacion_inicio_sesion.dart';



final appRouter = GoRouter(routes: [
  GoRoute(
    path: "/Principal",
    name: "Principal",
    builder: (context, state) => Principal(),),
    
  
  GoRoute(
    path: "/perfil",
    name: "perfil",
    builder: (context, state) => Perfil(),),

    GoRoute(
    path: "/",
    name: "inicio_sesion",
    builder: (context, state) => inicio_sesion(),),

    GoRoute(
    path: "/registro",
    name: "Registro",
    builder: (context, state) => Register(),),

/*
  GoRoute(
    path: "/biblioteca",
    name: "biblioteca",
    builder: (context, state) => Biblioteca(),
     )*/
    
  GoRoute(
    path: "/VerificacionInicioSesion",
    name: "VerificacionInicioSesion",
    builder: (context, state) => VerificacionInicioSesion(),
     )
    
]);