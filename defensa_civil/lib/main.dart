import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'main_menu_screen.dart';
import 'registro_incidencias_screen.dart';
import 'visualizacion_incidencias_screen.dart';
import 'acerca_de_screen.dart';
import 'seguridad_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación MINERD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/main_menu': (context) => MainMenuScreen(),
        '/registro_incidencias': (context) => RegistroIncidenciasScreen(),
        '/visualizacion_incidencias': (context) =>
            VisualizacionIncidenciasScreen(),
        '/acerca_de': (context) => AcercaDeScreen(),
        '/seguridad': (context) => SeguridadScreen(),
      },
    );
  }
}
