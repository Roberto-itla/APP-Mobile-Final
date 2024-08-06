import 'package:flutter/material.dart';

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
