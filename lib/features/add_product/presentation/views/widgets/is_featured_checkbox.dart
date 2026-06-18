import 'package:flutter/material.dart';

import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/custom_check_box.dart';

class IsFeaturedCheckBox extends StatefulWidget {
  const IsFeaturedCheckBox({super.key, required this.onChanged, required this.text});
  final ValueChanged<bool> onChanged;
  final String text;
  @override
  State<IsFeaturedCheckBox> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsFeaturedCheckBox> {

  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: widget.text,
                  style: AppTextStyles.semiBold13.copyWith(
                    color: Color(0xff949D9E),
                  ),
                ),
               
              ],
            ),
          ),
        ),

         CustomCheckBox(isChecked: isTermsAccepted, onChanged: (bool value) {
          isTermsAccepted = value;
          widget.onChanged(isTermsAccepted);
          setState(() {
            
          });
        }),
      ],
    );
  }
}
