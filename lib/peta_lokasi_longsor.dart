import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ewarn_app/locations.dart' as locations;


class PetaLokasiLongsor extends StatefulWidget {
  @override
  _PetaLokasiLongsorState createState() => _PetaLokasiLongsorState();
}

class _PetaLokasiLongsorState extends State<PetaLokasiLongsor> {
  final Map<String, Marker> _markers = {};
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


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Peta Lokasi Longsor',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white, fontFamily: 'Open Sans')),
        backgroundColor: Color(0xfff8c291),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: const LatLng(-7.317463, 111.761466),
          zoom: 2,
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }
}