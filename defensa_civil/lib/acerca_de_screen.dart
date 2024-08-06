import 'package:flutter/material.dart';

class AcercaDeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Acerca de')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/tu_foto.jpg'),
            ),
            SizedBox(height: 20),
            Text('Nombre: Juan Pérez'),
            Text('Apellido: Rodríguez'),
            Text('Matrícula: 123456'),
            SizedBox(height: 20),
            Text(
              '“La educación es el arma más poderosa que puedes usar para cambiar el mundo.” – Nelson Mandela',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
