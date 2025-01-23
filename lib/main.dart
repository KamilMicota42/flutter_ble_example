import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:sizer/sizer.dart';
import 'cubits/theme_mode/theme_mode_cubit.dart';
import 'services/secure_storage_service.dart';
import 'settings/injection.dart';
import 'settings/routes/app_router.dart';
import 'utils/global/default_theme.dart';
import 'utils/methods/show_snack_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(Environment.dev);
  await getIt<SecureStorageService>().init();
  await EasyLocalization.ensureInitialized();
  await FlutterBluePlus.setLogLevel(LogLevel.verbose, color: true);
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('pl')],
    path: 'lib/assets/translations',
    fallbackLocale: const Locale('pl'),
    startLocale: const Locale('pl'), // default language
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BluetoothAdapterState adapterState = BluetoothAdapterState.unknown;

  late StreamSubscription<BluetoothAdapterState> _adapterStateStateSubscription;

  @override
  void initState() {
    super.initState();
    _adapterStateStateSubscription = FlutterBluePlus.adapterState.listen((state) {
      adapterState = state;
      if (state.name == "on") {
        getIt<AppRouter>().maybePop();
      } else if (state.name == "off") {
        getIt<AppRouter>().navigate(BluetoothOffRoute(adapterState: state));
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _adapterStateStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();
    return BlocBuilder<ThemeModeCubit, ThemeModeState>(
      bloc: getIt<ThemeModeCubit>(),
      builder: (context, ThemeModeState state) {
        ThemeMode themeMode = state.when(systemMode: () => ThemeMode.system, lightMode: () => ThemeMode.light, darkMode: () => ThemeMode.dark);
        return Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp.router(
              theme: DefaultTheme.lightTheme,
              darkTheme: DefaultTheme.darkTheme,
              themeMode: themeMode,
              debugShowCheckedModeBanner: false,
              routerDelegate: appRouter.delegate(),
              routeInformationParser: appRouter.defaultRouteParser(),
              scaffoldMessengerKey: snackbarKey,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
            );
          },
        );
      },
    );
  }
}
