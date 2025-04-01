import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter_ble_example/models/binary_data_model/binary_data_model.dart';
import 'package:flutter_ble_example/models/string_data_model/string_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'device_data_state.dart';
part 'device_data_cubit.freezed.dart';

@lazySingleton
class DeviceDataCubit extends Cubit<DeviceDataState> {
  DeviceDataCubit() : super(DeviceDataState.initial());

  void decodeBleData(List<int> resultOfRead) {
    int deviceMode = resultOfRead[2];
    print(deviceMode);

    if (deviceMode == 1 || deviceMode == 2) {
      // FIRST AND SECOND MODE
      if (resultOfRead.length != 60) {
        print("Invalid data length: Expected 60 bytes, got ${resultOfRead.length}");
        return;
      }
      try {
        ByteData data = ByteData.sublistView(Uint8List.fromList(resultOfRead));
        BinaryDataModel decodedData = decodeDataInFirstOrSecondMode(data);
        if (deviceMode == 1) {
          print("emit first mode");
          emit(DeviceDataState.firstMode(newData: decodedData));
        } else if (deviceMode == 2) {
          print("emit second mode");
          emit(DeviceDataState.secondMode(newData: decodedData));
        }
      } catch (e) {
        print("Error decoding data (first || second mode): $e");
        return;
      }
    } else {
      // THIRD MODE
      try {
        ByteData byteData = ByteData.sublistView(Uint8List.fromList(String.fromCharCodes(resultOfRead).codeUnits));
        StringDataModel decodedData = decodeDataInThirdMode(byteData);
        print("emit third mode");
        emit(DeviceDataState.thirdMode(newData: decodedData));
      } catch (e) {
        print("Error decoding data (third mode): $e");
        return;
      }
    }
  }

  BinaryDataModel decodeDataInFirstOrSecondMode(ByteData data) {
    return BinaryDataModel(
      header: data.getUint8(0),
      mphInt: data.getUint8(1),
      modeId: data.getUint8(2),
      complete: data.getUint8(3),
      svs: data.getUint8(4),
      minValue: data.getUint16(5, Endian.little),
      maxValue: data.getUint16(7, Endian.little),
      endDistBin: data.getUint32(9, Endian.little),
      headingBin: data.getUint32(13, Endian.little),
      leanAngle: data.getUint8(17),
      accelX: data.getUint16(18, Endian.little),
      accelY: data.getUint16(20, Endian.little),
      accelZ: data.getUint16(22, Endian.little),
      accelG: data.getUint16(24, Endian.little),
      gyroX: data.getUint16(26, Endian.little),
      gyroY: data.getUint16(28, Endian.little),
      gyroZ: data.getUint16(30, Endian.little),
      imuTemp: data.getInt8(32),
      groundSpeedBin: data.getUint32(33, Endian.little),
      speedAccEstBin: data.getUint32(37, Endian.little),
      brakePSIBin: data.getUint16(41, Endian.little),
      currentTime: data.getUint32(43, Endian.little),
      latBin: data.getInt32(47, Endian.little) / 1e7, // Convert to actual latitude
      lonBin: data.getInt32(51, Endian.little) / 1e7, // Convert to actual longitude
      elapsed: data.getUint32(55, Endian.little),
      crc: data.getUint8(59),
    );
  }

  StringDataModel decodeDataInThirdMode(ByteData data) {
    int offset = 0;
    return StringDataModel(
        mph: data.getUint8(offset++),
        modeId: data.getUint8(offset++),
        complete: data.getUint8(offset++),
        svs: data.getUint8(offset++),
        minValue: data.getUint16(offset, Endian.little),
        maxValue: data.getUint16(offset += 2, Endian.little),
        endDist: data.getUint32(offset += 2, Endian.little),
        heading: data.getUint32(offset += 4, Endian.little),
        leanAngle: data.getUint8(offset += 4),
        accelX: data.getUint16(offset += 1, Endian.little),
        accelY: data.getUint16(offset += 2, Endian.little),
        accelZ: data.getUint16(offset += 2, Endian.little),
        accelG: data.getUint16(offset += 2, Endian.little),
        gyroX: data.getUint16(offset += 2, Endian.little),
        gyroY: data.getUint16(offset += 2, Endian.little),
        gyroZ: data.getUint16(offset += 2, Endian.little),
        imuTemp: data.getInt8(offset += 2),
        groundSpeed: data.getUint32(offset += 1, Endian.little),
        speedAccEst: data.getUint32(offset += 4, Endian.little),
        brakePSI: data.getUint16(offset += 4, Endian.little),
        currentTime: data.getUint32(offset += 2, Endian.little),
        latitude: data.getInt32(offset += 4, Endian.little),
        longitude: data.getInt32(offset += 4, Endian.little),
        elapsed: data.getUint32(offset += 4, Endian.little));
  }
}
