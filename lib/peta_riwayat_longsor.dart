import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ewarn_app/locations.dart' as locations;
import 'package:location/location.dart';


class PetaRiwayatLongsor extends StatefulWidget {
  @override
  _PetaRiwayatLongsorState createState() => _PetaRiwayatLongsorState();
}

class _PetaRiwayatLongsorState extends State<PetaRiwayatLongsor> {
  final Map<String, Marker> _markers = {};
  final LatLng _center = const LatLng(-7.317463, 111.761466);
  LatLng _lastMapPosition = const LatLng(-7.317463, 111.761466);

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final riwayat_bencana in googleOffices.riwayat_bencana) {
        final marker = Marker(
          markerId: MarkerId(riwayat_bencana.id.toString()),
          position: LatLng(riwayat_bencana.latitude, riwayat_bencana.longitude),
          infoWindow: InfoWindow(
            title: riwayat_bencana.desa,
            snippet: riwayat_bencana.tahun,
          ),
        );
        _markers[riwayat_bencana.desa] = marker;
      }
    });
  }
  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
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
          zoom: 10.0,
        ),
        onCameraMove: _onCameraMove,
        markers: _markers.values.toSet(),
      ),
    );
  }
}