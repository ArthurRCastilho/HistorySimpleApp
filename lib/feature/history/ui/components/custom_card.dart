import 'package:flutter/material.dart';
import 'package:history_simple_app/core/theme/app_colors.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  const CustomCard({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withAlpha(80),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.secondaryColor,
          width: 1.2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
