import 'package:assesment_app/Model/models/product_model.dart';

abstract class ProductStates {}

class ProductInitialState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductSuccessState extends ProductStates {
   List<ProductModel> model=[];
  ProductSuccessState(this.model);
}

class ProductErrorState extends ProductStates {
  final String errMessage;

  ProductErrorState(
    this.errMessage,
  );
}
