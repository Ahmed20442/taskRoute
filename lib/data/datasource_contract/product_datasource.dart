import 'package:dartz/dartz.dart';
import 'package:route_task/data/model/product_response/ProductResponse.dart';

abstract class ProductData{
  Future<Either<ProductResponse,String>>GetProduct();

}