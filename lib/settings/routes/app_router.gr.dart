// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [BluetoothOffScreen]
class BluetoothOffRoute extends PageRouteInfo<BluetoothOffRouteArgs> {
  BluetoothOffRoute({
    Key? key,
    BluetoothAdapterState? adapterState,
    List<PageRouteInfo>? children,
  }) : super(
          BluetoothOffRoute.name,
          args: BluetoothOffRouteArgs(
            key: key,
            adapterState: adapterState,
          ),
          initialChildren: children,
        );

  static const String name = 'BluetoothOffRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BluetoothOffRouteArgs>(
          orElse: () => const BluetoothOffRouteArgs());
      return BluetoothOffScreen(
        key: args.key,
        adapterState: args.adapterState,
      );
    },
  );
}

class BluetoothOffRouteArgs {
  const BluetoothOffRouteArgs({
    this.key,
    this.adapterState,
  });

  final Key? key;

  final BluetoothAdapterState? adapterState;

  @override
  String toString() {
    return 'BluetoothOffRouteArgs{key: $key, adapterState: $adapterState}';
  }
}

/// generated route for
/// [DeviceScreen]
class DeviceRoute extends PageRouteInfo<DeviceRouteArgs> {
  DeviceRoute({
    Key? key,
    required BluetoothDevice device,
    List<PageRouteInfo>? children,
  }) : super(
          DeviceRoute.name,
          args: DeviceRouteArgs(
            key: key,
            device: device,
          ),
          initialChildren: children,
        );

  static const String name = 'DeviceRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DeviceRouteArgs>();
      return DeviceScreen(
        key: args.key,
        device: args.device,
      );
    },
  );
}

class DeviceRouteArgs {
  const DeviceRouteArgs({
    this.key,
    required this.device,
  });

  final Key? key;

  final BluetoothDevice device;

  @override
  String toString() {
    return 'DeviceRouteArgs{key: $key, device: $device}';
  }
}

/// generated route for
/// [DeviceValuesScreen]
class DeviceValuesRoute extends PageRouteInfo<void> {
  const DeviceValuesRoute({List<PageRouteInfo>? children})
      : super(
          DeviceValuesRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeviceValuesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DeviceValuesScreen();
    },
  );
}

/// generated route for
/// [ScanScreen]
class ScanRoute extends PageRouteInfo<void> {
  const ScanRoute({List<PageRouteInfo>? children})
      : super(
          ScanRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ScanScreen();
    },
  );
}
