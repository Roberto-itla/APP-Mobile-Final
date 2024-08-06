import 'package:flutter/material.dart';

class SeguridadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seguridad')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Lógica para borrar todos los registros
          },
          child: Text('Borrar Todos los Registros'),
        ),
      ),
    );
  }
}
