import 'package:dark_mode/src/providers/theme_provider.dart';
import 'package:dark_mode/src/shared_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Modo Oscuro'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SwitchListTile.adaptive(
            value: prefs.isDarkmode,
            activeColor: Colors.black,
            title: const Text('Modo Oscuro'),
            onChanged: (value) {
              setState(() {
                prefs.isDarkmode = value;
                final themeProvider =
                    Provider.of<ThemeProvider>(context, listen: false);
                value
                    ? themeProvider.setDarkmode()
                    : themeProvider.setLightMode();
              });
            },
          ),
        ],
      ),
    );
  }
}
