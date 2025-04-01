part of 'device_data_cubit.dart';

@freezed
class DeviceDataState with _$DeviceDataState {
  const factory DeviceDataState.initial() = _Initial;
  const factory DeviceDataState.firstMode({required BinaryDataModel newData}) = _FirstMode;
  const factory DeviceDataState.secondMode({required BinaryDataModel newData}) = _SecondMode;
  const factory DeviceDataState.thirdMode({required StringDataModel newData}) = _ThirdMode;
  const factory DeviceDataState.error({required String error}) = _Error;
}
