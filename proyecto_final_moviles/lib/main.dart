import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/rutas/app_router.dart';
import 'package:proyecto_final_moviles/servicios/servicios.dart';
import 'package:proyecto_final_moviles/temas/dia.dart';
import 'package:proyecto_final_moviles/temas/noche.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeService().init(); // Inicializa el servicio de temas
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final ThemeService _themeService = ThemeService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: temaDia,          // Tema claro
      darkTheme: temaNoche,    // Tema oscuro
      themeMode: _themeService.modoOscuro ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
