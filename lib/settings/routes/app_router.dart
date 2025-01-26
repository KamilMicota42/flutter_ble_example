import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:injectable/injectable.dart';
import '../../views/bluetooth_off_screen/bluetooth_off_screen.dart';
import '../../views/device_screen/device_screen.dart';
import '../../views/scan_screen/scan_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
@lazySingleton
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ScanRoute.page, initial: true),
        AutoRoute(page: BluetoothOffRoute.page),
        AutoRoute(page: DeviceRoute.page),
      ];
}
