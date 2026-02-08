import 'package:flutter/material.dart';
import 'package:history_simple_app/core/theme/app_colors.dart';

class CustomLoading extends StatelessWidget {
  final String? message;

  const CustomLoading({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                ),
              ),
              Icon(
                Icons.history_edu,
                size: 24,
                color: AppColors.primaryColor,
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (message != null)
            Text(
              message!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
        ],
      ),
    );
  }
}
