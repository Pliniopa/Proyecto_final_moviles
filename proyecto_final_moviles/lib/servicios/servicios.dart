import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static final ThemeService _instance = ThemeService._internal();
  static bool _modoOscuro = false;
  late SharedPreferences _prefs;

  factory ThemeService() {
    return _instance;
  }

  ThemeService._internal();

  /// Inicializa el servicio cargando la preferencia guardada
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _modoOscuro = _prefs.getBool('modoOscuro') ?? false;
  }

  bool get modoOscuro => _modoOscuro;

  /// Alterna entre modo claro y oscuro
  Future<void> toggleTema() async {
    _modoOscuro = !_modoOscuro;
    await _prefs.setBool('modoOscuro', _modoOscuro);
  }

  /// Fija directamente el modo oscuro/claro
  Future<void> setModoOscuro(bool valor) async {
    _modoOscuro = valor;
    await _prefs.setBool('modoOscuro', _modoOscuro);
  }
}
