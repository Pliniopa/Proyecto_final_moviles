import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> registrarUsuario(
  String usuario,
  String contrasena,
  String nombre,
  String fechaNacimiento,
) async {
  final url = Uri.parse("http://127.0.0.1:8000/registrar"); // Ajusta tu host
  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "usuario": usuario,
      "contrasena": contrasena,
      "nombre": nombre,
      "fecha_nacimiento": fechaNacimiento,
    }),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body); // ✅ Devuelve un Map usable
  } else {
    return {"status": "error", "message": "Error en el servidor"};
  }
}

Future<Map<String, dynamic>> loginUsuario(
  String usuario,
  String contrasena,
) async {
  final url = Uri.parse("http://127.0.0.1:8000/login");
  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({"usuario": usuario, "contrasena": contrasena}),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    return {"status": "error", "message": "Error en el servidor"};
  }
}
