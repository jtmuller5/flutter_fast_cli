// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rowy_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RowyImage _$RowyImageFromJson(Map<String, dynamic> json) => RowyImage(
      downloadURL: json['downloadURL'] as String?,
      lastModifiedTS: (json['lastModifiedTS'] as num?)?.toDouble(),
      name: json['name'] as String?,
      ref: json['ref'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$RowyImageToJson(RowyImage instance) => <String, dynamic>{
      'downloadURL': instance.downloadURL,
      'lastModifiedTS': instance.lastModifiedTS,
      'name': instance.name,
      'ref': instance.ref,
      'type': instance.type,
    };
