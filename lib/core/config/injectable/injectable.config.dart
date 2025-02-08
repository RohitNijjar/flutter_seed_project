// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/auth/data/datasources/api/auth_api.dart' as _i470;
import '../../../features/auth/data/repositories/auth_repository.dart' as _i960;
import '../../../features/auth/domain/interfaces/iauth_repository.dart'
    as _i992;
import '../../../features/auth/domain/usecases/login_usecase.dart' as _i849;
import '../../../features/auth/domain/usecases/register_usecase.dart' as _i879;
import '../../../features/splash/presentation/providers/splash_provider.dart'
    as _i975;
import '../../network/api_client.dart' as _i972;

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
    final apiClient = _$ApiClient();
    gh.factory<_i975.SplashNotifier>(() => _i975.SplashNotifier());
    gh.lazySingleton<_i361.Dio>(() => apiClient.apiClient);
    gh.factory<_i470.AuthApi>(() => _i470.AuthApi(gh<_i361.Dio>()));
    gh.factory<_i992.IAuthRepository>(
        () => _i960.AuthRepository(gh<_i470.AuthApi>()));
    gh.factory<_i849.LoginUseCase>(
        () => _i849.LoginUseCase(gh<_i992.IAuthRepository>()));
    gh.factory<_i879.RegisterUseCase>(
        () => _i879.RegisterUseCase(gh<_i992.IAuthRepository>()));
    return this;
  }
}

class _$ApiClient extends _i972.ApiClient {}
