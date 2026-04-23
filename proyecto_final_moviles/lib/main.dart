import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/rutas/app_router.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget {
    const App({super.key});
    
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: appRouter
      ,
    );
  }
}