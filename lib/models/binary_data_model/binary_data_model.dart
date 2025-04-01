import 'package:freezed_annotation/freezed_annotation.dart';

part 'binary_data_model.freezed.dart';
part 'binary_data_model.g.dart';

@freezed
class BinaryDataModel with _$BinaryDataModel {
  factory BinaryDataModel({
    int? header,
    int? mphInt,
    int? modeId,
    int? complete,
    int? svs,
    int? minValue,
    int? maxValue,
    int? endDistBin,
    int? headingBin,
    int? leanAngle,
    int? accelX,
    int? accelY,
    int? accelZ,
    int? accelG,
    int? gyroX,
    int? gyroY,
    int? gyroZ,
    int? imuTemp,
    int? groundSpeedBin,
    int? speedAccEstBin,
    int? brakePSIBin,
    int? currentTime,
    double? latBin,
    double? lonBin,
    int? elapsed,
    int? crc,
  }) = _BinaryDataModel;

  factory BinaryDataModel.fromJson(Map<String, dynamic> json) => _$BinaryDataModelFromJson(json);
}
