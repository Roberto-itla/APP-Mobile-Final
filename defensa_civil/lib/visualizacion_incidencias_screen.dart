import 'package:flutter/material.dart';

class VisualizacionIncidenciasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Visualización de Incidencias')),
      body: ListView.builder(
        itemCount: 10, // Número de incidencias (ejemplo)
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Incidencia $index'),
            subtitle: Text('Descripción de la incidencia $index'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetalleIncidenciaScreen(index: index)),
              );
            },
          );
        },
      ),
    );
  }
}

class DetalleIncidenciaScreen extends StatelessWidget {
  final int index;

  DetalleIncidenciaScreen({this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalle de Incidencia $index')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Título: Incidencia $index'),
            Text('Descripción: Descripción de la incidencia $index'),
            // Mostrar foto y reproducir audio
          ],
        ),
      ),
    );
  }
}
