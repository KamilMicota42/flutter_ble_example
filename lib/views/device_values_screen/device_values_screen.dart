import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ble_example/cubits/device_data/cubit/device_data_cubit.dart';
import 'package:flutter_ble_example/models/binary_data_model/binary_data_model.dart';
import 'package:flutter_ble_example/models/string_data_model/string_data_model.dart';
import 'package:flutter_ble_example/settings/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;

@RoutePage()
class DeviceValuesScreen extends StatelessWidget {
  const DeviceValuesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(getIt<DeviceDataCubit>().state);
    print(getIt<DeviceDataCubit>().state.maybeMap(
          firstMode: (value) => value.newData,
          secondMode: (value) => value.newData,
          thirdMode: (value) => value.newData,
          orElse: () => null,
        ));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("BLE DEVICE CURRENT VALUES"),
            BlocBuilder<DeviceDataCubit, DeviceDataState>(
              bloc: getIt<DeviceDataCubit>(), // Use the cubit from getIt
              builder: (context, state) {
                return state.maybeMap(
                  firstMode: (value) => _buildFirstOrSecondModeUI(value.newData),
                  secondMode: (value) => _buildFirstOrSecondModeUI(value.newData),
                  thirdMode: (value) => _buildThirdModeUI(value.newData),
                  error: (value) => Text(
                    "Error: ${value.error}",
                    style: const TextStyle(color: Colors.red),
                  ),
                  orElse: () => const Text("No data available"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstOrSecondModeUI(BinaryDataModel data) {
    return Column(
      children: [
        Text("Mode: ${data.modeId}"),
        Text("Header: ${data.header}"),
        Text("Speed: ${data.mphInt} mph"),
        Text("Latitude: ${data.latBin}"),
        Text("Longitude: ${data.lonBin}"),
        Text("Complete: ${data.complete}"),
        Text("SVS: ${data.svs}"),
        Text("Min Value: ${data.minValue}"),
        Text("Max Value: ${data.maxValue}"),
        Text("End Distance: ${data.endDistBin}"),
        Text("Heading: ${data.headingBin}"),
        Text("Lean Angle: ${data.leanAngle}"),
        Text("Accel X: ${data.accelX}"),
        Text("Accel Y: ${data.accelY}"),
        Text("Accel Z: ${data.accelZ}"),
        Text("Accel G: ${data.accelG}"),
        Text("Gyro X: ${data.gyroX}"),
        Text("Gyro Y: ${data.gyroY}"),
        Text("Gyro Z: ${data.gyroZ}"),
        Text("IMU Temp: ${data.imuTemp}"),
        Text("Ground Speed: ${data.groundSpeedBin}"),
        Text("Speed Accuracy Estimate: ${data.speedAccEstBin}"),
        Text("Brake PSI: ${data.brakePSIBin}"),
        Text("Current Time: ${data.currentTime}"),
        Text("Elapsed: ${data.elapsed}"),
        Text("CRC: ${data.crc}"),
      ],
    );
  }

  Widget _buildThirdModeUI(StringDataModel data) {
    return Column(
      children: [
        Text("Mode: ${data.modeId}"),
        Text("Speed: ${data.mph} mph"),
        Text("Latitude: ${data.latitude}"),
        Text("Longitude: ${data.longitude}"),
        Text("Complete: ${data.complete}"),
        Text("SVS: ${data.svs}"),
        Text("Min Value: ${data.minValue}"),
        Text("Max Value: ${data.maxValue}"),
        Text("End Distance: ${data.endDist}"),
        Text("Heading: ${data.heading}"),
        Text("Lean Angle: ${data.leanAngle}"),
        Text("Accel X: ${data.accelX}"),
        Text("Accel Y: ${data.accelY}"),
        Text("Accel Z: ${data.accelZ}"),
        Text("Accel G: ${data.accelG}"),
        Text("Gyro X: ${data.gyroX}"),
        Text("Gyro Y: ${data.gyroY}"),
        Text("Gyro Z: ${data.gyroZ}"),
        Text("IMU Temp: ${data.imuTemp}"),
        Text("Ground Speed: ${data.groundSpeed}"),
        Text("Speed Accuracy Estimate: ${data.speedAccEst}"),
        Text("Brake PSI: ${data.brakePSI}"),
        Text("Current Time: ${data.currentTime}"),
        Text("Elapsed: ${data.elapsed}"),
      ],
    );
  }
}
