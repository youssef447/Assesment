
abstract class ProductStates {}

class ProductInitialState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductSuccessState extends ProductStates {
  ProductSuccessState();
}

class ProductErrorState extends ProductStates {
  final String errMessage;

  ProductErrorState(
    this.errMessage,
  );
}

class ProductDetailsLoadingState extends ProductStates {}

class ProductDetailsSuccessState extends ProductStates {
  ProductDetailsSuccessState();
}

class ProductDetailsErrorState extends ProductStates {
  final String errMessage;

  ProductDetailsErrorState(
    this.errMessage,
  );
}

class ProductChangeVariantState extends ProductStates {}

