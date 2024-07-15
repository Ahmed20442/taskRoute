// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/product_datasource.dart' as _i4;
import '../../data/datasource_imp/product_datasource_impl.dart' as _i5;
import '../../data/repository_imp/product_repo_impl.dart' as _i7;
import '../../Domain/repository_contract/Product_repo_contract.dart' as _i6;
import '../../Domain/usecase/product_usecase.dart' as _i8;
import '../../presentation/home/products/view_model/product_cubit.dart'
    as _i9;
import '../api/api_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.ProductData>(
        () => _i5.ProductDataImp(gh<_i3.ApiManager>()));
    gh.factory<_i6.ProductRepo>(
        () => _i7.ProductRepoImp(gh<_i4.ProductData>()));
    gh.factory<_i8.ProductUseCase>(
        () => _i8.ProductUseCase(gh<_i6.ProductRepo>()));
    gh.factory<_i9.ProductVeiwModel>(
        () => _i9.ProductVeiwModel(gh<_i8.ProductUseCase>()));
    return this;
  }
}
