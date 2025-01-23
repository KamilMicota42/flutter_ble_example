import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../services/secure_storage_service.dart';
import '../../settings/injection.dart';

part 'theme_mode_state.dart';
part 'theme_mode_cubit.freezed.dart';

@LazySingleton()
class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(const ThemeModeState.systemMode());

  Future<void> setSystemMode() async {
    await getIt<SecureStorageService>().setThemeMode(ThemeMode.system);
    emit(const ThemeModeState.systemMode());
  }

  Future<void> setLightMode() async {
    await getIt<SecureStorageService>().setThemeMode(ThemeMode.light);
    emit(const ThemeModeState.lightMode());
  }

  Future<void> setDarkMode() async {
    await getIt<SecureStorageService>().setThemeMode(ThemeMode.dark);
    emit(const ThemeModeState.darkMode());
  }
}
