import 'package:flutter/material.dart';

class RegistroIncidenciasScreen extends StatefulWidget {
  @override
  _RegistroIncidenciasScreenState createState() =>
      _RegistroIncidenciasScreenState();
}

class _RegistroIncidenciasScreenState extends State<RegistroIncidenciasScreen> {
  final _tituloController = TextEditingController();
  final _centroEducativoController = TextEditingController();
  final _regionalController = TextEditingController();
  final _distritoController = TextEditingController();
  final _fechaController = TextEditingController();
  final _descripcionController = TextEditingController();
  // Variables para la foto y audio

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro de Incidencias')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _centroEducativoController,
              decoration: InputDecoration(labelText: 'Centro Educativo'),
            ),
            TextField(
              controller: _regionalController,
              decoration: InputDecoration(labelText: 'Regional'),
            ),
            TextField(
              controller: _distritoController,
              decoration: InputDecoration(labelText: 'Distrito'),
            ),
            TextField(
              controller: _fechaController,
              decoration: InputDecoration(labelText: 'Fecha'),
              onTap: () async {
                DateTime pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  setState(() {
                    _fechaController.text = pickedDate.toString().split(' ')[0];
                  });
                }
              },
            ),
            TextField(
              controller: _descripcionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            // Widgets para foto y audio
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para guardar la incidencia
              },
              child: Text('Guardar Incidencia'),
            ),
          ],
        ),
      ),
    );
  }
}
