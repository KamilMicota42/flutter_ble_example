// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binary_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BinaryDataModelImpl _$$BinaryDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BinaryDataModelImpl(
      header: (json['header'] as num?)?.toInt(),
      mphInt: (json['mphInt'] as num?)?.toInt(),
      modeId: (json['modeId'] as num?)?.toInt(),
      complete: (json['complete'] as num?)?.toInt(),
      svs: (json['svs'] as num?)?.toInt(),
      minValue: (json['minValue'] as num?)?.toInt(),
      maxValue: (json['maxValue'] as num?)?.toInt(),
      endDistBin: (json['endDistBin'] as num?)?.toInt(),
      headingBin: (json['headingBin'] as num?)?.toInt(),
      leanAngle: (json['leanAngle'] as num?)?.toInt(),
      accelX: (json['accelX'] as num?)?.toInt(),
      accelY: (json['accelY'] as num?)?.toInt(),
      accelZ: (json['accelZ'] as num?)?.toInt(),
      accelG: (json['accelG'] as num?)?.toInt(),
      gyroX: (json['gyroX'] as num?)?.toInt(),
      gyroY: (json['gyroY'] as num?)?.toInt(),
      gyroZ: (json['gyroZ'] as num?)?.toInt(),
      imuTemp: (json['imuTemp'] as num?)?.toInt(),
      groundSpeedBin: (json['groundSpeedBin'] as num?)?.toInt(),
      speedAccEstBin: (json['speedAccEstBin'] as num?)?.toInt(),
      brakePSIBin: (json['brakePSIBin'] as num?)?.toInt(),
      currentTime: (json['currentTime'] as num?)?.toInt(),
      latBin: (json['latBin'] as num?)?.toDouble(),
      lonBin: (json['lonBin'] as num?)?.toDouble(),
      elapsed: (json['elapsed'] as num?)?.toInt(),
      crc: (json['crc'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BinaryDataModelImplToJson(
        _$BinaryDataModelImpl instance) =>
    <String, dynamic>{
      'header': instance.header,
      'mphInt': instance.mphInt,
      'modeId': instance.modeId,
      'complete': instance.complete,
      'svs': instance.svs,
      'minValue': instance.minValue,
      'maxValue': instance.maxValue,
      'endDistBin': instance.endDistBin,
      'headingBin': instance.headingBin,
      'leanAngle': instance.leanAngle,
      'accelX': instance.accelX,
      'accelY': instance.accelY,
      'accelZ': instance.accelZ,
      'accelG': instance.accelG,
      'gyroX': instance.gyroX,
      'gyroY': instance.gyroY,
      'gyroZ': instance.gyroZ,
      'imuTemp': instance.imuTemp,
      'groundSpeedBin': instance.groundSpeedBin,
      'speedAccEstBin': instance.speedAccEstBin,
      'brakePSIBin': instance.brakePSIBin,
      'currentTime': instance.currentTime,
      'latBin': instance.latBin,
      'lonBin': instance.lonBin,
      'elapsed': instance.elapsed,
      'crc': instance.crc,
    };
