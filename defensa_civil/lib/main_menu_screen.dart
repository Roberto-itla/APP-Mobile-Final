import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menú Principal')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Registro de Incidencias'),
            onTap: () {
              Navigator.pushNamed(context, '/registro_incidencias');
            },
          ),
          ListTile(
            title: Text('Visualización de Incidencias'),
            onTap: () {
              Navigator.pushNamed(context, '/visualizacion_incidencias');
            },
          ),
          ListTile(
            title: Text('Acerca de'),
            onTap: () {
              Navigator.pushNamed(context, '/acerca_de');
            },
          ),
          ListTile(
            title: Text('Seguridad'),
            onTap: () {
              Navigator.pushNamed(context, '/seguridad');
            },
          ),
        ],
      ),
    );
  }
}
