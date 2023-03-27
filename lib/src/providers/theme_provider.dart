import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData
      currentTheme; //Propiedad ThemeData que se modificará para cambiar el tema del proyecto

  ThemeProvider({required bool isDarkmode})
      //Al crear el Provider hay que mandarle el isDarkMode del SharedPreferences así sabrá si estaba activado o desactivado
      : currentTheme = isDarkmode ? ThemeData.dark() : ThemeData.light();

  setLightMode() {
    //Método para cambiar el themeData, con notifyListeners para que todos los que escuchen(childs) adopten el cambio también
    currentTheme = ThemeData.light();
    notifyListeners();
  }

  setDarkmode() {
    //Método para cambiar el themeData, con notifyListeners para que todos los que escuchen(childs) adopten el cambio también
    currentTheme = ThemeData.dark();
    notifyListeners();
  }
}
