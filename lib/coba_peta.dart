import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:ewarn_app/lokasi_rawan.dart' as locations;

/// Represents a tourism location a user can visit.
class Desa {
  final String NAMOBJ;
  final String status;

  Desa(this.NAMOBJ, this.status);

// NOTE: implementing functionality here in the next step!
}

class PetaRawanCoba extends StatefulWidget {
  @override
  _PetaRawanCobaState createState() => _PetaRawanCobaState();
}

class _PetaRawanCobaState extends State<PetaRawanCoba> {
  late MapShapeSource _dataSource = MapShapeSource.asset(
      'maps/wilayah_bojonegoro.json',
      shapeDataField: 'NAMOBJ');
  late List<Desa> data = <Desa>[];


  @override
  void initState() {
    super.initState();
    data = <Desa>[
      Desa('Dander',"Sedang"),
      Desa('SENDANGAGUNG',"Tinggi"),
      Desa('KAYULEMAH',"Sedang"),
      Desa('BANJAREJO',"Rendah"),
      Desa('KEDUNGREJO',"Sedang"),

      Desa('Nglebak',"Sedang"),
      Desa('Kalangan',"Tinggi"),
      Desa('Megeri',"Sedang"),
      Desa('Kerek',"Sedang"),
      Desa('KANOREJO',"Tinggi"),

      Desa('KALIREJO',"Sedang"),
      Desa('SRANAK',"Tinggi"),
      Desa('MULYOREJO',"Sedang"),
      Desa('CANGAAN',"Sedang"),
      Desa('BANJARJO',"Sedang"),
    ];
    _dataSource = MapShapeSource.asset(
      'maps/wilayah_bojonegoro.json',
      shapeDataField: 'NAMOBJ',
      dataCount: data.length,
      primaryValueMapper: (int index) {
        return data[index].NAMOBJ;
      },
      shapeColorValueMapper: (int index) {
        return data[index].status;
      },
      shapeColorMappers: [
        MapColorMapper(value: "Tinggi", color: Colors.red, text: 'Tinggi'),
        MapColorMapper(value: "Rendah", color: Colors.green, text : 'Rendah'),
        MapColorMapper(value: "Sedang", color: Colors.orangeAccent, text: 'Sedang')
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Peta Rawan Longsor',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Open Sans')),
          backgroundColor: Color(0xffeaB543),
        ),
        body: SfMaps(
            layers: [
              MapShapeLayer(
                source: _dataSource,
                color: Colors.green,
                strokeColor: Colors.black,
                legend: MapLegend(
                  MapElement.shape,
                ),
                strokeWidth: 1,
                shapeTooltipBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(7),
                    child: Text('Desa : ${data[index].NAMOBJ}\nStatus: ${data[index].status}',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  );
                },
                tooltipSettings: MapTooltipSettings(
                    color: Colors.grey[700],
                    strokeColor: Colors.white,
                    strokeWidth: 2),
              )
            ],
        ));
  }
}
