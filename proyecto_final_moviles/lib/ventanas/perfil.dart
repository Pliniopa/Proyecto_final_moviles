import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/temas/estilo_tintero.dart';
import 'package:proyecto_final_moviles/ventanas/Foto_perfil/boton_cierre.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final TextEditingController _descripcionController = TextEditingController();

  @override
  void dispose() {
    _descripcionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TinteroBackground(
        image: fondoPerfil,
        opacity: 0.26,
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(0, 84, 0, 110),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 69,
                      backgroundColor: Color(0xFFD4EFF8),
                      backgroundImage: AssetImage(tinteroAvatar),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Nombre de la persona",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 22),
                    const Text(
                      "@usuario",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                    const TinteroWave(),
                    const SizedBox(height: 10),
                    const Text(
                      "Tus gustos",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 52),
                    TextField(
                      controller: _descripcionController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText:
                            "Pulsa aqui para agregar una descripcion sobre ti",
                        hintStyle: TextStyle(
                          color: Colors.white.withValues(alpha: 0.6),
                        ),
                        filled: true,
                        fillColor: tinteroPanel,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          "Lista de lecturas de (nombre de usuario)",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BookCover(
                            image: "assets/img/imagen7.png",
                            width: 95,
                            height: 120,
                          ),
                          const BookCover(
                            image: "assets/img/imagen8.png",
                            width: 95,
                            height: 120,
                          ),
                          Container(
                            width: 95,
                            height: 120,
                            color: tinteroDeep,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 38,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Opacity(
                      opacity: 0.76,
                      child: TinteroLogo(width: 130),
                    ),
                  ],
                ),
              ),
              const BotonCierreSesion(),
              const TinteroBottomNav(currentIndex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
