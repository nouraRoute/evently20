import 'package:evently/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  const CustomMainButton({super.key, required this.isLoading, this.onPressed, required this.label});
  final bool isLoading;
  final Function()? onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24),
      width: double.infinity,
      height: 56,
      child: FilledButton(
        onPressed: isLoading ? null : onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.mainColors,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: isLoading ? CircularProgressIndicator() : Text(label),
      ),
    );
  }
}
