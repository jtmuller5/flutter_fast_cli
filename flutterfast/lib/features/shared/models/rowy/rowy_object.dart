import 'package:flutterfast/features/shared/models/rowy/rowy_update.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class RowyObject {
  @JsonKey(name: '_createdBy')
  final RowyUpdate? createdBy;

  @JsonKey(name: '_updatedBy')
  final RowyUpdate? updatedBy;

  RowyObject({required this.createdBy, required this.updatedBy});
}
