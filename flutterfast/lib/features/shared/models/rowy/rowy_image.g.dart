// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rowy_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RowyImage _$RowyImageFromJson(Map<String, dynamic> json) => $checkedCreate(
      'RowyImage',
      json,
      ($checkedConvert) {
        final val = RowyImage(
          downloadURL: $checkedConvert('downloadURL', (v) => v as String?),
          lastModifiedTS:
              $checkedConvert('lastModifiedTS', (v) => (v as num?)?.toDouble()),
          name: $checkedConvert('name', (v) => v as String?),
          ref: $checkedConvert('ref', (v) => v as String?),
          type: $checkedConvert('type', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$RowyImageToJson(RowyImage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('downloadURL', instance.downloadURL);
  writeNotNull('lastModifiedTS', instance.lastModifiedTS);
  writeNotNull('name', instance.name);
  writeNotNull('ref', instance.ref);
  writeNotNull('type', instance.type);
  return val;
}
