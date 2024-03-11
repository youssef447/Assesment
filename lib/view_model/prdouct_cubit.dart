import 'package:assesment_app/Model/repos/product_repo.dart';
import 'package:assesment_app/config/dependencies/injection.dart';
import 'package:assesment_app/view_model/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());
  static ProductCubit get(context) => BlocProvider.of(context);

  getProducts() async {
    emit(ProductLoadingState());

    final response = await locators.get<ProductRepo>().getProducts();

    response.fold((l) {
      emit(
        ProductErrorState(l.errMessage),
      );
    }, (r) {
      emit(ProductSuccessState(r));
    });
  }
}
