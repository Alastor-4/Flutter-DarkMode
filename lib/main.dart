import 'package:dark_mode/src/pages/home_page.dart';
import 'package:dark_mode/src/providers/theme_provider.dart';
import 'package:dark_mode/src/shared_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //Esta linea inicializa el WidgetsFlutterBinding necesario si se hace el main async
  final prefs = PreferenciasUsuario(); //inicializa las Shared Preferences
  await prefs.initPrefs();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          //Para que el provider funcione y notifique los childs tiene que estar creado en una instancia superior,
          //por eso se hace un Wrap al MaterialApp con MultiProvider
          create: (_) => ThemeProvider(isDarkmode: prefs.isDarkmode))
    ], //Nota: MultiProvider puede inicializar mas Providers, no solo de Tema
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dark Mode',
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context)
          .currentTheme, //Carga el tema del Provider
    );
  }
}
