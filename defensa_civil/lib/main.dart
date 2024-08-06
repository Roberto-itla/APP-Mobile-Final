import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InputScreen(),
    );
  }
}

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _surnameController,
                decoration: InputDecoration(labelText: 'Surname'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your surname';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _latitudeController,
                decoration: InputDecoration(labelText: 'Latitude'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the latitude';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _longitudeController,
                decoration: InputDecoration(labelText: 'Longitude'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the longitude';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapScreen(
                          name: _nameController.text,
                          surname: _surnameController.text,
                          latitude: double.parse(_latitudeController.text),
                          longitude: double.parse(_longitudeController.text),
                        ),
                      ),
                    );
                  }
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MapScreen extends StatefulWidget {
  final String name;
  final String surname;
  final double latitude;
  final double longitude;

  MapScreen({this.name, this.surname, this.latitude, this.longitude});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController mapController;
  String address = '';

  @override
  void initState() {
    super.initState();
    _getAddress();
  }

  _getAddress() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(widget.latitude, widget.longitude);
    Placemark place = placemarks[0];
    setState(() {
      address = '${place.locality}, ${place.country}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.latitude, widget.longitude),
          zoom: 14.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('marker_1'),
            position: LatLng(widget.latitude, widget.longitude),
            infoWindow: InfoWindow(
              title: '${widget.name} ${widget.surname}',
              snippet: address,
            ),
          ),
        },
      ),
    );
  }
}
