import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ewarn_app/lokasi_desa.dart' as locations;
import 'package:location/location.dart';

import 'package:clippy_flutter/triangle.dart';
import 'package:flutter/material.dart';

class PetaDesa extends StatefulWidget {
  @override
  _PetaDesaState createState() => _PetaDesaState();
}

class _PetaDesaState extends State<PetaDesa> {
  final Map<String, Marker> _markers = {};
  static const label = ['Rendah', 'Sedang', 'Tinggi'];
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _customInfoWindowController.googleMapController = controller;
    final googleOffices = await locations.getGoogleOffices();
    List<Color> colors = [Colors.green, Colors.orange, Colors.red];
    setState(() {
      _markers.clear();
      for (final data_desa in googleOffices.data_desa) {
        final marker = Marker(
          markerId: MarkerId(data_desa.id.toString()),
          position: LatLng(data_desa.latitude, data_desa.longitude),
          // infoWindow: InfoWindow(
          //   title: data_desa.desa,
          //   snippet: 'Status Banjir : ${label[data_desa.status_banjir]}'
          //       '\nStatus Longsor : ${label[data_desa.status_longsor]}'
          //       '\nStatus Kekeringan : ${label[data_desa.status_kekeringan]}'
          //       '\nStatus Puting Beliung : ${label[data_desa.status_putbel]}'
          //   ,
          // ),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Column(
                              children : [
                                Align(
                                  alignment: Alignment.center,
                                  child : Text('Desa ${data_desa.desa}', style : TextStyle(fontSize : 20, fontWeight: FontWeight.bold))
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.water,
                                      color : Colors.black,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(text: 'Banjir : ', style: TextStyle(color : Colors.black)),
                                          TextSpan(text: '${label[data_desa.status_banjir]}', style: TextStyle(color : colors[data_desa.status_banjir], fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.landscape,
                                      color : Colors.black,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(text: 'Longsor : ', style: TextStyle(color : Colors.black)),
                                          TextSpan(text: '${label[data_desa.status_longsor]}', style: TextStyle(color : colors[data_desa.status_longsor], fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.wind,
                                      color : Colors.black,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(text: 'Puting Beliung : ', style: TextStyle(color : Colors.black)),
                                          TextSpan(text: '${label[data_desa.status_putbel]}', style: TextStyle(color : colors[data_desa.status_putbel], fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.brightness_solid,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(text: 'Kekeringan : ', style: TextStyle(color : Colors.black)),
                                          TextSpan(text: '${label[data_desa.status_kekeringan]}', style: TextStyle(color : colors[data_desa.status_kekeringan], fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ]
                            )

                      ),
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Triangle.isosceles(
                    edge: Edge.BOTTOM,
                    child: Container(
                      color: Colors.white,
                      width: 20.0,
                      height: 10.0,
                    ),
                  ),
                ],
              ),
              LatLng(data_desa.latitude, data_desa.longitude),
            );
          },
        );
        _markers[data_desa.desa] = marker;
      }
    });
  }

  Location location = new Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;

  _locateMe() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  @override
  initState() {
    super.initState();
    _locateMe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Peta Desa',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Open Sans')),
          backgroundColor: Color(0xffeaB543),
        ),
        body: Stack(children: <Widget>[
          GoogleMap(
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: const LatLng(-7.317463, 111.761466),
              zoom: 15.0,
            ),
            markers: _markers.values.toSet(),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 150,
            width: 200,
            offset: 50,
          ),
        ]));
  }
}
