// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lokasi_desa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DesaRawan _$DesaRawanFromJson(Map<String, dynamic> json) {
  return DesaRawan(
    desa: json['desa'] as String,
    id: (json['id'] as num).toInt(),
    kecamatan: json['kecamatan'] as String,
    latitude: double.parse(json['latitude']),
    longitude: double.parse(json['longitude']),
    status_banjir: (json['status_banjir'] as num).toInt(),
    status_longsor: (json['status_longsor'] as num).toInt(),
    status_kekeringan: (json['status_kekeringan'] as num).toInt(),
    status_putbel: (json['status_putbel'] as num).toInt(),

  );
}

Map<String, dynamic> _$DesaRawanToJson(DesaRawan instance) =>
    <String, dynamic>{
      'desa': instance.desa,
      'id': instance.id,
      'kecamatan': instance.kecamatan,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'status_banjir': instance.status_banjir,
      'status_longsor': instance.status_longsor,
      'status_kekeringan': instance.status_kekeringan,
      'status_putbel': instance.status_putbel,
    };

Locations _$LocationsFromJson(Map<String, dynamic> json) {
  return Locations(
    data_desa: (json['data_desa'] as List<dynamic>)
        .map((e) => DesaRawan.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LocationsToJson(Locations instance) => <String, dynamic>{
  'data_desa': instance.data_desa,
};
