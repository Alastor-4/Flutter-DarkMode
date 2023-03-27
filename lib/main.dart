import 'package:dark_mode/src/pages/home_page.dart';
import 'package:dark_mode/src/providers/theme_provider.dart';
import 'package:dark_mode/src/shared_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkmode: prefs.isDarkmode))
    ],
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
      title: 'Preferencias',
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
