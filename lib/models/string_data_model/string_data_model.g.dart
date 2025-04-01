// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'string_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StringDataModelImpl _$$StringDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StringDataModelImpl(
      mph: (json['mph'] as num?)?.toInt(),
      modeId: (json['modeId'] as num?)?.toInt(),
      complete: (json['complete'] as num?)?.toInt(),
      svs: (json['svs'] as num?)?.toInt(),
      minValue: (json['minValue'] as num?)?.toInt(),
      maxValue: (json['maxValue'] as num?)?.toInt(),
      endDist: (json['endDist'] as num?)?.toInt(),
      heading: (json['heading'] as num?)?.toInt(),
      leanAngle: (json['leanAngle'] as num?)?.toInt(),
      accelX: (json['accelX'] as num?)?.toInt(),
      accelY: (json['accelY'] as num?)?.toInt(),
      accelZ: (json['accelZ'] as num?)?.toInt(),
      accelG: (json['accelG'] as num?)?.toInt(),
      gyroX: (json['gyroX'] as num?)?.toInt(),
      gyroY: (json['gyroY'] as num?)?.toInt(),
      gyroZ: (json['gyroZ'] as num?)?.toInt(),
      imuTemp: (json['imuTemp'] as num?)?.toInt(),
      groundSpeed: (json['groundSpeed'] as num?)?.toInt(),
      speedAccEst: (json['speedAccEst'] as num?)?.toInt(),
      brakePSI: (json['brakePSI'] as num?)?.toInt(),
      currentTime: (json['currentTime'] as num?)?.toInt(),
      latitude: (json['latitude'] as num?)?.toInt(),
      longitude: (json['longitude'] as num?)?.toInt(),
      elapsed: (json['elapsed'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$StringDataModelImplToJson(
        _$StringDataModelImpl instance) =>
    <String, dynamic>{
      'mph': instance.mph,
      'modeId': instance.modeId,
      'complete': instance.complete,
      'svs': instance.svs,
      'minValue': instance.minValue,
      'maxValue': instance.maxValue,
      'endDist': instance.endDist,
      'heading': instance.heading,
      'leanAngle': instance.leanAngle,
      'accelX': instance.accelX,
      'accelY': instance.accelY,
      'accelZ': instance.accelZ,
      'accelG': instance.accelG,
      'gyroX': instance.gyroX,
      'gyroY': instance.gyroY,
      'gyroZ': instance.gyroZ,
      'imuTemp': instance.imuTemp,
      'groundSpeed': instance.groundSpeed,
      'speedAccEst': instance.speedAccEst,
      'brakePSI': instance.brakePSI,
      'currentTime': instance.currentTime,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'elapsed': instance.elapsed,
    };
