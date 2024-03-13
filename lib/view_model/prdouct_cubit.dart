import 'package:assesment_app/Model/models/product_model.dart';
import 'package:assesment_app/Model/repos/product_repo.dart';
import 'package:assesment_app/config/dependencies/injection.dart';
import 'package:assesment_app/view_model/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Model/models/product_details_model.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());
  static ProductCubit get(context) => BlocProvider.of(context);

  List<ProductModel> model = [];
  late ProductDetailsModel detailsModel;
  int currentVariant = 0;
  int currentVariantId=0;
  getProducts() async {
    emit(ProductLoadingState());

    final response = await locators.get<ProductRepo>().getProducts();

    response.fold((l) {
      emit(
        ProductErrorState(l.errMessage),
      );
    }, (r) {
      model = r;
      emit(ProductSuccessState());
    });
  }
  getProductDetails({required String productId}) async {
    emit(ProductDetailsLoadingState());

    final response = await locators
        .get<ProductRepo>()
        .getProductDetails(productId: productId);

    response.fold((l) {
      emit(
        ProductDetailsErrorState(l.errMessage),
      );
    }, (r) {
      detailsModel = r;
    // detailsModel.properties.forEach((element) { element.value. });
      emit(ProductDetailsSuccessState());
    });
  }

  changeVariantIndex(int index) {
    currentVariant = index;
currentVariantId=detailsModel.variations[currentVariant].id!;
    emit(ProductChangeVariantState());
  }
}
