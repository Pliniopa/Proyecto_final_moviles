import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/servicios/servicios.dart';

class BotonLuna extends StatefulWidget {
  final ValueChanged<bool>? onToggle; // Notifica al padre

  const BotonLuna({super.key, this.onToggle});

  @override
  State<BotonLuna> createState() => _BotonLunaState();
}

class _BotonLunaState extends State<BotonLuna> {
  final ThemeService _themeService = ThemeService();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: IconButton(
        iconSize: 30,
        icon: Icon(
          Icons.nightlight_round,
          color: _themeService.modoOscuro ? Colors.yellow : Colors.black,
        ),
        onPressed: () async {
          await _themeService.toggleTema();
          setState(() {});
          widget.onToggle?.call(_themeService.modoOscuro);
        },
      ),
    );
  }
}
