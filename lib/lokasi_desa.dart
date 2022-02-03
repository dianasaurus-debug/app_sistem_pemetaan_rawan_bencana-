import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'lokasi_desa.g.dart';

@JsonSerializable()
class DesaRawan {
  DesaRawan({
    required this.desa,
    required this.id,
    required this.kecamatan,
    required this.latitude,
    required this.longitude,
    required this.status_banjir,
    required this.status_longsor,
    required this.status_putbel,
    required this.status_kekeringan,


  });

  factory DesaRawan.fromJson(Map<String, dynamic> json) => _$DesaRawanFromJson(json);
  Map<String, dynamic> toJson() => _$DesaRawanToJson(this);

  final String desa;
  final int id;
  final String kecamatan;
  final double latitude;
  final double longitude;
  final int status_banjir;
  final int status_longsor;
  final int status_putbel;
  final int status_kekeringan;
}

@JsonSerializable()
class Locations {
  Locations({
    required this.data_desa,
  });

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);
  Map<String, dynamic> toJson() => _$LocationsToJson(this);

  final List<DesaRawan> data_desa;

}

Future<Locations> getGoogleOffices() async {
  const googleLocationsURL = 'http://192.168.43.204:8000/api/semua-desa/';

  // Retrieve the locations of Google offices
  final response = await http.get(Uri.parse(googleLocationsURL));
  if (response.statusCode == 200) {
    print(json.decode(response.body));
    return Locations.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
            ' ${response.reasonPhrase}',
        uri: Uri.parse(googleLocationsURL));
  }
}