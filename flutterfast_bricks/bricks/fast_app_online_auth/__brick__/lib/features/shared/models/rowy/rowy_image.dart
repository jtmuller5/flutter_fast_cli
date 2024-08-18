import 'package:json_annotation/json_annotation.dart';

part 'rowy_image.g.dart';

@JsonSerializable(explicitToJson: true)
class RowyImage {
  String? downloadURL;
  double? lastModifiedTS;
  String? name;
  String? ref;
  String? type;

  RowyImage({
    this.downloadURL,
    this.lastModifiedTS,
    this.name,
    this.ref,
    this.type,
  });

  factory RowyImage.fromJson(Map<String, dynamic> json) =>
      _$RowyImageFromJson(json);

  Map<String, dynamic> toJson() => _$RowyImageToJson(this);
}
