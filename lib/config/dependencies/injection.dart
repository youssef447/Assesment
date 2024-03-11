
import 'package:get_it/get_it.dart';

import '../../Model/data_sources/product_services.dart';
import '../../Model/repos/product_repo.dart';

final locators = GetIt.instance;

configurationDependencies() {
  locators.registerLazySingleton(
    () => ProductRepo(
      service: ProductServices(),
    ),
  );
}
