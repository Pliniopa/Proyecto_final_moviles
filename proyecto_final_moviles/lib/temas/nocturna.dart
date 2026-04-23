import 'package:flutter/material.dart';

class BotonLuna extends StatefulWidget {
  final VoidCallback? onPressed;

  const BotonLuna({Key? key, this.onPressed}) : super(key: key);

  @override
  _BotonLunaState createState() => _BotonLunaState();
}

class _BotonLunaState extends State<BotonLuna> {
  bool modoAlternativo = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: IconButton(
        iconSize: 50,
        icon: Icon(
          Icons.nightlight_round,
          color: modoAlternativo ? Colors.yellow : Colors.black,
        ),
        onPressed: () {
          setState(() {
            modoAlternativo = !modoAlternativo;
          });
          if (widget.onPressed != null) {
            widget.onPressed!();
          }
        },
      ),
    );
  }
}
