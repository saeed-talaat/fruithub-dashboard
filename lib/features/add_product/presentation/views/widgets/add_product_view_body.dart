import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_form_field.dart';
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
  bool isFeatured = false;
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
                hintText: 'Product Name',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Price',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Code',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Description',
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              const SizedBox(height: 16),

              IsFeaturedCheckBox(onChanged: (value) => isFeatured),

              const SizedBox(height: 16),
              ImageField(
                onFileChange: (File? image) {
                  fileImage = image;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
