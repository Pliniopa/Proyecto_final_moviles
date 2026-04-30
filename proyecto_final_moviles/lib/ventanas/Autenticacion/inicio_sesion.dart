import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final_moviles/servicios/login_usuario.dart';
import 'package:proyecto_final_moviles/temas/estilo_tintero.dart';

class InicioSesion extends StatefulWidget {
  const InicioSesion({super.key});

  @override
  State<InicioSesion> createState() => _InicioSesionState();
}

class _InicioSesionState extends State<InicioSesion> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userController = TextEditingController();

  final List<String> _covers = const [
    'assets/img/imagen1.png',
    'assets/img/imagen3.png',
    'assets/img/imagen4.png',
  ];

  @override
  void dispose() {
    _passwordController.dispose();
    _userController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    final response = await loginUsuario(
      _userController.text.trim(),
      _passwordController.text.trim(),
    );

    if (!mounted) return;

    if (response["status"] == "success") {
      context.goNamed("Principal");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response["message"] ?? "Credenciales inválidas"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TinteroBackground(
        image: fondoInicio,
        opacity: 0.56,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 26, 24, 28),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const TinteroLogo(width: 170),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _userController,
                    decoration: tinteroInputDecoration("Usuario"),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Ingresa tu usuario";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: tinteroInputDecoration("Contraseña"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingresa tu contraseña";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: _login,
                    child: const Text(
                      "Ingresar",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.goNamed("Registro"),
                    child: const Text(
                      "Registrar usuario",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const TinteroWave(),
                  const SizedBox(height: 22),
                  SizedBox(
                    height: 145,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (final cover in _covers)
                          BookCover(image: cover, width: 108, height: 144),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  const _InfoPill(),
                  const SizedBox(height: 20),
                  const _InfoPill(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  const _InfoPill();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 25, right: 14),
      decoration: BoxDecoration(
        color: tinteroPanel,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              "Tintero es una app para todos, aca puedes encontrar historias increibles.",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
          Container(
            width: 65,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFE0E0E0),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
