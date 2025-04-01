import 'package:freezed_annotation/freezed_annotation.dart';

part 'string_data_model.freezed.dart';
part 'string_data_model.g.dart';

@freezed
class StringDataModel with _$StringDataModel {
  factory StringDataModel({
    int? mph,
    int? modeId,
    int? complete,
    int? svs,
    int? minValue,
    int? maxValue,
    int? endDist,
    int? heading,
    int? leanAngle,
    int? accelX,
    int? accelY,
    int? accelZ,
    int? accelG,
    int? gyroX,
    int? gyroY,
    int? gyroZ,
    int? imuTemp,
    int? groundSpeed,
    int? speedAccEst,
    int? brakePSI,
    int? currentTime,
    int? latitude,
    int? longitude,
    int? elapsed,
  }) = _StringDataModel;

  factory StringDataModel.fromJson(Map<String, dynamic> json) => _$StringDataModelFromJson(json);
}
