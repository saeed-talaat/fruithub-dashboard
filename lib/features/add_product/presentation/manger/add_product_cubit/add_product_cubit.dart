import 'package:flutter_bloc/flutter_bloc.dart';import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.imagesRepo, required this.productsRepo})
    : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct({
    required AddProductEntity addProductInputEntity,
  }) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(
      imageFile: addProductInputEntity.image,
    );
    result.fold(
      (failure) => emit(AddProductFailure(errorMessage: failure.errorMessage)),
      (url) async {
        addProductInputEntity.imageUrl = url;
        var result = await productsRepo.addProduct(
          addProductEntity: addProductInputEntity,
        );

        result.fold(
          (failures) =>
              emit(AddProductFailure(errorMessage: failures.errorMessage)),
          (r) => emit(AddProductSuccess()),
        );
      },
    );
  }
}
