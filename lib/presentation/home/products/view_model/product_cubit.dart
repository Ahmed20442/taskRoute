import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/Domain/entity/product_entity.dart';

import '../../../../Domain/usecase/product_usecase.dart';




@injectable
class ProductVeiwModel extends Cubit<HomesStates>{
  @factoryMethod
  ProductVeiwModel(this.products):super(HomesInitialState());

  ProductUseCase products;

  Getpro()async{
    emit(HomesLoadingState());
    var result = await products.call();
    result.fold((c){
      emit(HomesSuccessState(c));
    }, (error){
      emit(HomesErrorState(error));
    });
  }
}

abstract class HomesStates{}
class HomesInitialState extends HomesStates{}
class HomesLoadingState extends HomesStates{}
class HomesSuccessState extends HomesStates{
  List<ProductEntity> products;
  HomesSuccessState(this.products);
}
class HomesErrorState extends HomesStates{
  String error;
  HomesErrorState(this.error);
}
