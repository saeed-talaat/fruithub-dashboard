import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_functions.dart/show_snack_bar.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_modal_progress_hud.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/manger/add_product_cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductViewBodyBlocConsumer extends StatelessWidget {
  const AddProductViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductFailure) {
          showErrorSnackBar(context, state.errorMessage);
          Navigator.pop(context);
        } else if (state is AddProductSuccess) {
          showSuccessSnackBar(context, 'added product successfuly');
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHud(
          message: 'add product .....',
          isLoading: state is AddProductLoading ? true : false,
          child: AddProductViewBody(),
        );
      },
    );
  }
}
