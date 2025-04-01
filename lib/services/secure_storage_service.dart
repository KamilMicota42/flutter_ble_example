import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cubits/theme_mode/theme_mode_cubit.dart';
import '../settings/injection.dart';

@lazySingleton
class SecureStorageService {
  final _storage = const FlutterSecureStorage();
  final _iosOptions =
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  final String _tokenKey = 'TOKEN_KEY';
  final String _themeModeKey = 'THEME_MODE_KEY';

  Future<SecureStorageService> init() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('first_run') ?? true) {
      FlutterSecureStorage storage = const FlutterSecureStorage();

      await storage.deleteAll();

      prefs.setBool('first_run', false);
    }
    await loadLastThemeMode();
    return this;
  }

  Future<void> _write(String key, dynamic value) async {
    await _storage.write(key: key, value: value, iOptions: _iosOptions);
  }

  Future<String?> _read(String key) async {
    return await _storage.read(key: key, iOptions: _iosOptions);
  }

  Future<void> saveToken(String token) async {
    await _write(_tokenKey, token);
  }

  Future<String?> getToken() async {
    return await _read(_tokenKey);
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    await _write(_themeModeKey, themeMode.name);
  }

  Future<ThemeMode> getThemeMode() async {
    final String? themeModeString = await _read(_themeModeKey);
    if (themeModeString != null) {
      return ThemeMode.values
          .firstWhere((themeModeEnum) => themeModeEnum.name == themeModeString);
    } else {
      return ThemeMode.system;
    }
  }

  Future<void> loadLastThemeMode() async {
    ThemeMode themeMode = await getThemeMode();
    if (themeMode == ThemeMode.system) {
      getIt<ThemeModeCubit>().setSystemMode();
    } else if (themeMode == ThemeMode.light) {
      getIt<ThemeModeCubit>().setLightMode();
    } else {
      getIt<ThemeModeCubit>().setDarkMode();
    }
  }
}
