import 'package:flutter/material.dart';

import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/custom_check_box.dart';

class IsFeaturedCheckBox extends StatefulWidget {
  const IsFeaturedCheckBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<IsFeaturedCheckBox> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsFeaturedCheckBox> {

  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(isChecked: isTermsAccepted, onChanged: (bool value) {
          isTermsAccepted = value;
          widget.onChanged(isTermsAccepted);
          setState(() {
            
          });
        }),
        const SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'is Featured Item?',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: Color(0xff949D9E),
                  ),
                ),
               
              ],
            ),
          ),
        ),
      ],
    );
  }
}
