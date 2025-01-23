part of 'theme_mode_cubit.dart';

@freezed
class ThemeModeState with _$ThemeModeState {
  const factory ThemeModeState.systemMode() = _SystemMode;
  const factory ThemeModeState.lightMode() = _LightMode;
  const factory ThemeModeState.darkMode() = _DarkMode;
}
