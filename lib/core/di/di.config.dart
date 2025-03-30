// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../data/datasource/auth_remote_datasource.dart' as _i126;
import '../../presentation/auth/view_model/auth_view_model.dart' as _i594;
import '../datasource_execution/datasource_execution.dart' as _i166;
import '../providers/app_config_provider.dart' as _i56;
import '../utils/validators.dart' as _i885;
import 'modules/firebase_auth_module.dart' as _i222;
import 'modules/shared_preferences_module.dart' as _i813;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final firebaseAuthModule = _$FirebaseAuthModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i166.DataSourceExecution>(() => _i166.DataSourceExecution());
    gh.singleton<_i56.AppConfigProvider>(() => _i56.AppConfigProvider());
    gh.lazySingleton<_i59.FirebaseAuth>(
        () => firebaseAuthModule.provideFirebaseAuth());
    gh.factory<_i885.Validators>(
        () => _i885.Validators(gh<_i56.AppConfigProvider>()));
    gh.factory<_i126.AuthRemoteDatasource>(() => _i126.AuthRemoteDatasource(
          gh<_i59.FirebaseAuth>(),
          gh<_i166.DataSourceExecution>(),
        ));
    gh.factory<_i594.AuthViewModel>(() => _i594.AuthViewModel(
          gh<_i56.AppConfigProvider>(),
          gh<_i885.Validators>(),
          gh<_i126.AuthRemoteDatasource>(),
        ));
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$FirebaseAuthModule extends _i222.FirebaseAuthModule {}
