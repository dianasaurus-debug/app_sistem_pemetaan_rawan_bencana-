import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class PetaRiwayatLongsor extends StatefulWidget {
  @override
  _PetaRiwayatLongsorState createState() => _PetaRiwayatLongsorState();
}

class _PetaRiwayatLongsorState extends State<PetaRiwayatLongsor> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-6.873512, 111.964173);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Peta Riwayat Longsor',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white, fontFamily: 'Open Sans')),
        backgroundColor: Color(0xfff8c291),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}