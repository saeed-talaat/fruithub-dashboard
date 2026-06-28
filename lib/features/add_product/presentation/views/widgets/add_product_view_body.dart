import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_functions.dart/show_snack_bar.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_bottom.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/manger/add_product_cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_checkbox.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  File? fileImage;
  bool isFeatured = false, isOrganic = false;
  late String name, code, description;
  late num price ,  expirationsMonths, numberOfCalories, unitAmount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) => name = value!,
                hintText: 'Product Name',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) => price = num.parse(value!),
                hintText: 'Product Price',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) => code = value!.toLowerCase(),
                hintText: 'Product Code',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),

              CustomTextFormField(
                onSaved: (value) => expirationsMonths = num.parse(value!),
                hintText: ' expirationsMonths',
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              CustomTextFormField(
                onSaved: (value) => numberOfCalories = num.parse(value!),
                hintText: ' numberOfCalories',
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              CustomTextFormField(
                onSaved: (value) => unitAmount = num.parse(value!),
                hintText: ' unitAmount',
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) => description = value!,
                hintText: 'Product Description',
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              IsFeaturedCheckBox(
                onChanged: (value) => isFeatured = value,
                text: 'is Featured Item?',
              ),
              const SizedBox(height: 16),

              IsFeaturedCheckBox(
                onChanged: (value) => isOrganic = value,
                text: 'is Orginc Item?',
              ),

              const SizedBox(height: 16),
              ImageField(
                onFileChange: (File? image) {
                  fileImage = image;
                },
              ),
              const SizedBox(height: 32),
              CustomBottom(
                onPressed: () {
                  if (fileImage != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      ProductEntity input = ProductEntity(
                        productName: name,
                        productCode: code,
                        productDescription: description,
                        productPrice: price,
                        isFeatured: isFeatured,
                        image: fileImage!,
                        expirationsMonths: expirationsMonths.toInt(),
                        isOrganic: isOrganic,
                        numberOfCalories: numberOfCalories.toInt(),
                        unitAmount: unitAmount.toInt(),
                      );
                      context.read<AddProductCubit>().addProduct(
                        addProductInputEntity: input,
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showInfoSnackBar(context, 'select image required');
                  }
                },
                text: 'Add Product',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
