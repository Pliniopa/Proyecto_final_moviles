import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final_moviles/servicios/login_usuario.dart';
import 'package:proyecto_final_moviles/temas/estilo_tintero.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _userController.dispose();
    _nombreController.dispose();
    _monthController.dispose();
    _dayController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    _monthController.text = pickedDate.month.toString().padLeft(2, '0');
    _dayController.text = pickedDate.day.toString().padLeft(2, '0');
    _yearController.text = pickedDate.year.toString();
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    final fechaNacimiento =
        "${_dayController.text}/${_monthController.text}/${_yearController.text}";

    final response = await registrarUsuario(
      _userController.text.trim(),
      _passwordController.text.trim(),
      _nombreController.text.trim(),
      fechaNacimiento,
    );

    if (!mounted) return;

    if (response["status"] == "success") {
      context.goNamed("VerificacionInicioSesion");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Error en el registro: ${response["message"] ?? "Intenta nuevamente"}",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TinteroBackground(
        image: fondoInicio,
        opacity: 0.58,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(18, 22, 18, 28),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(child: TinteroLogo(width: 160)),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _userController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: tinteroInputDecoration("Correo electronico"),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Ingresa tu correo";
                      }
                      if (!value.contains('@')) {
                        return "El correo debe contener @";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _nombreController,
                    decoration: tinteroInputDecoration("Nombre de usuario"),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Ingresa tu nombre";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "¿Cual es tu fecha de nacimiento?",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _DateField(
                          controller: _monthController,
                          hint: "MM",
                          onTap: _selectDate,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _DateField(
                          controller: _dayController,
                          hint: "DD",
                          onTap: _selectDate,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _DateField(
                          controller: _yearController,
                          hint: "AAAA",
                          onTap: _selectDate,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 56),
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
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: tinteroInputDecoration("Confirmar contraseña"),
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return "Las contraseñas no coinciden";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 96),
                  Center(
                    child: TinteroButton(
                      text: "Registrarte",
                      width: 320,
                      onPressed: _register,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => context.goNamed("inicio_sesion"),
                    child: const Text(
                      "Inicio de sesión",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DateField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final VoidCallback onTap;

  const _DateField({
    required this.controller,
    required this.hint,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      textAlign: TextAlign.center,
      onTap: onTap,
      decoration: tinteroInputDecoration(hint),
      validator: (value) {
        if (value == null || value.isEmpty) return "";
        return null;
      },
    );
  }
}
