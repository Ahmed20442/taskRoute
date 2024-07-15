import 'package:dartz/dartz.dart';
import 'package:route_task/Domain/entity/product_entity.dart';

abstract class ProductRepo{
  Future<Either<List<ProductEntity>,String>>GetProduct();
}