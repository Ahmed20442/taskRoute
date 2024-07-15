import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/core/api/api_manager.dart';
import 'package:route_task/core/api/endpoint.dart';
import 'package:route_task/data/datasource_contract/product_datasource.dart';
import 'package:route_task/data/model/product_response/ProductResponse.dart';
@Injectable(as:ProductData )
class ProductDataImp extends ProductData{
  ApiManager apiManager;
  @factoryMethod
  ProductDataImp(this.apiManager);
  @override
  Future<Either<ProductResponse, String>> GetProduct()async {
   try{
     var response = await apiManager.getRequest(Endpoint: Endpoints.Product);
     ProductResponse productResponse=ProductResponse.fromJson(response.data);
     return left(productResponse);
   }catch(error){
     return right(error.toString());
   }
  }

}