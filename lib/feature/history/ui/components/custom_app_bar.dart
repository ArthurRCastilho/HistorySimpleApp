import 'package:flutter/material.dart';
import 'package:history_simple_app/core/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.history_edu,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          // Textos
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fatos Históricos',
                style: TextStyle(
                  fontFamily: 'Serif',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2D2A26),
                ),
              ),
              const Text(
                'Explore a história por ano',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
