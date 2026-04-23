

import 'package:go_router/go_router.dart';
import 'package:proyecto_final_moviles/ventanas/biblioteca.dart';
import 'package:proyecto_final_moviles/ventanas/inicio_sesion.dart';
import 'package:proyecto_final_moviles/ventanas/perfil.dart';
import 'package:proyecto_final_moviles/ventanas/principal.dart';
import 'package:proyecto_final_moviles/ventanas/register.dart';



final appRouter = GoRouter(routes: [
  /*GoRoute(
    path: "/inicio",
    name: "inicio",
    builder: (context, state) => Principal(),),
    */
  
  /*GoRoute(
    path: "/perfil",
    name: "perfil",
    builder: (context, state) => Perfil(),),
*/
    GoRoute(
    path: "/",
    name: "inicio_sesion",
    builder: (context, state) => inicio_sesion(),),

    GoRoute(
    path: "/registro",
    name: "Registro",
    builder: (context, state) => register(),),

/*
  GoRoute(
    path: "/biblioteca",
    name: "biblioteca",
    builder: (context, state) => Biblioteca(),)*/
]);