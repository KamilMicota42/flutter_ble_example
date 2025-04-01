// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_ble_example/cubits/theme_mode/theme_mode_cubit.dart'
    as _i2;
import 'package:flutter_ble_example/data/remote/repositories/user_repository.dart'
    as _i166;
import 'package:flutter_ble_example/data/remote/services/api_service.dart'
    as _i642;
import 'package:flutter_ble_example/services/secure_storage_service.dart'
    as _i633;
import 'package:flutter_ble_example/settings/routes/app_router.dart' as _i688;
import 'package:flutter_ble_example/utils/methods/decode_data.dart' as _i151;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i688.AppRouter>(() => _i688.AppRouter());
    gh.lazySingleton<_i2.ThemeModeCubit>(() => _i2.ThemeModeCubit());
    gh.lazySingleton<_i151.DecodeData>(() => _i151.DecodeData());
    gh.lazySingleton<_i166.UserRepository>(() => _i166.UserRepository());
    gh.lazySingleton<_i642.ApiService>(() => _i642.ApiService());
    gh.lazySingleton<_i633.SecureStorageService>(
        () => _i633.SecureStorageService());
    return this;
  }
}
