// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/shared/shared_cubit.dart' as _i6;
import '../data/local/data_base_source.dart' as _i3;
import '../data/prefrences/shared_prefrences.dart' as _i4;
import '../data/repos/repo_implementation.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.NoteDataBase>(() => _i3.NoteDataBase());
  gh.lazySingleton<_i4.SharedData>(() => _i4.SharedData());
  gh.lazySingleton<_i5.RepoImp>(
      () => _i5.RepoImp(get<_i3.NoteDataBase>(), get<_i4.SharedData>()));
  gh.factory<_i6.SharedCubit>(() => _i6.SharedCubit(get<_i5.RepoImp>()));
  return get;
}
