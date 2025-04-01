import 'dart:convert';
import 'dart:typed_data';
import 'package:injectable/injectable.dart';

@lazySingleton
class DecodeData {
  void decodeBleData(List<int> resultOfRead) {
    int deviceMode = resultOfRead[3];
    print(deviceMode);

    if (deviceMode == 1 || deviceMode == 2) {
      // FIRST AND SECOND MODE
      if (resultOfRead.length != 60) {
        print("Invalid data length: Expected 60 bytes, got ${resultOfRead.length}");
        return;
      }
      try {
        ByteData data = ByteData.sublistView(Uint8List.fromList(resultOfRead));
        Map<String, dynamic> decodedData = decodeDataInFirstOrSecondMode(data);
        print("Decoded Data: $decodedData");
      } catch (e) {
        print("Error decoding data: $e");
        return;
      }
    } else {
      // THIRD MODE
      try {
        ByteData byteData = ByteData.sublistView(Uint8List.fromList(String.fromCharCodes(resultOfRead).codeUnits));
        Map<String, dynamic> decodedData = decodeDataInThirdMode(byteData);

        print(jsonEncode(decodedData));
      } catch (e) {
        print("Error decoding data: $e");
        return;
      }
    }
  }

  Map<String, dynamic> decodeDataInFirstOrSecondMode(ByteData data) {
    return {
      "header": data.getUint8(0),
      "mphInt": data.getUint8(1),
      "modeId": data.getUint8(2),
      "complete": data.getUint8(3),
      "SVs": data.getUint8(4),
      "minValue": data.getUint16(5, Endian.little),
      "maxValue": data.getUint16(7, Endian.little),
      "endDistBin": data.getUint32(9, Endian.little),
      "headingBin": data.getUint32(13, Endian.little),
      "leanAngle": data.getUint8(17),
      "accelX": data.getUint16(18, Endian.little),
      "accelY": data.getUint16(20, Endian.little),
      "accelZ": data.getUint16(22, Endian.little),
      "accelG": data.getUint16(24, Endian.little),
      "gyroX": data.getUint16(26, Endian.little),
      "gyroY": data.getUint16(28, Endian.little),
      "gyroZ": data.getUint16(30, Endian.little),
      "imuTemp": data.getInt8(32),
      "groundSpeedBin": data.getUint32(33, Endian.little),
      "speedAccEstBin": data.getUint32(37, Endian.little),
      "brakePSIBin": data.getUint16(41, Endian.little),
      "currentTime": data.getUint32(43, Endian.little),
      "latBin": data.getInt32(47, Endian.little) / 1e7, // Convert to actual latitude
      "lonBin": data.getInt32(51, Endian.little) / 1e7, // Convert to actual longitude
      "elapsed": data.getUint32(55, Endian.little),
      "crc": data.getUint8(59),
    };
  }

  decodeDataInThirdMode(ByteData data) {
    int offset = 0;
    return {
      "mph": data.getUint8(offset++),
      "modeId": data.getUint8(offset++),
      "complete": data.getUint8(offset++),
      "SVs": data.getUint8(offset++),
      "minValue": data.getUint16(offset, Endian.little),
      "maxValue": data.getUint16(offset += 2, Endian.little),
      "endDist": data.getUint32(offset += 2, Endian.little),
      "heading": data.getUint32(offset += 4, Endian.little),
      "leanAngle": data.getUint8(offset += 4),
      "accelX": data.getUint16(offset += 1, Endian.little),
      "accelY": data.getUint16(offset += 2, Endian.little),
      "accelZ": data.getUint16(offset += 2, Endian.little),
      "accelG": data.getUint16(offset += 2, Endian.little),
      "gyroX": data.getUint16(offset += 2, Endian.little),
      "gyroY": data.getUint16(offset += 2, Endian.little),
      "gyroZ": data.getUint16(offset += 2, Endian.little),
      "imuTemp": data.getInt8(offset += 2),
      "groundSpeed": data.getUint32(offset += 1, Endian.little),
      "speedAccEst": data.getUint32(offset += 4, Endian.little),
      "brakePSI": data.getUint16(offset += 4, Endian.little),
      "currentTime": data.getUint32(offset += 2, Endian.little),
      "latitude": data.getInt32(offset += 4, Endian.little),
      "longitude": data.getInt32(offset += 4, Endian.little),
      "elapsed": data.getUint32(offset += 4, Endian.little)
    };
  }
}
