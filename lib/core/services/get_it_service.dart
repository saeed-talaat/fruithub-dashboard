import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo_imple.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/products_repo_imple.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/services/fire_storge_services.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_service.dart';
import 'package:fruits_hub_dashboard/core/services/storge_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<StorgeServices>(FireStorgeServices());
    getIt.registerSingleton<DatabaseService>(FirestoreService());

  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImple(storgeServices: getIt<StorgeServices>()),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImple(databaseService: getIt<DatabaseService>()),
  );
}
