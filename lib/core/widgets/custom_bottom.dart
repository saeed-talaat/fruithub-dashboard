import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';


class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      
      style: TextButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        backgroundColor:AppColors.primaryColor, 
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style:AppTextStyles.bold16.copyWith(color: Colors.white)
      ),
    );
  }
}
