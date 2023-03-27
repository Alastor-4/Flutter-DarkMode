import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia = PreferenciasUsuario
      ._internal(); //al inicializarse llama la propiedad _internal()

  factory PreferenciasUsuario() {
    //constructor factory, si existe una instancia la devuelve, sino la crea
    return _instancia;
  }

  PreferenciasUsuario._internal();

  late SharedPreferences?
      _prefs; //crea una instancia de SharedPreferences que permite almacenar datos simples de forma persistente
  static bool _isDarkmode =
      false; //propiedad estática booleana que almacenará de forma persistente el estado del tema de la aplicación

  initPrefs() async {
    _prefs = await SharedPreferences
        .getInstance(); //Con este método carga la instancia de SharedPreferences
  }

  bool get isDarkmode {
    //método get para obtener el valor de la propiedad estática _isDarkMode
    return _prefs!.getBool('isDarkmode') ?? _isDarkmode;
  }

  set isDarkmode(bool value) {
    //método set para cambiar el valor del _isDarkMode
    _isDarkmode = value;
    _prefs!.setBool('isDarkmode', value);
  }
}
