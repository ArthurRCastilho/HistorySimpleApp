import 'package:flutter/material.dart';
import 'package:history_simple_app/core/theme/app_colors.dart';
import 'package:history_simple_app/feature/history/ui/components/custom_card.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 8,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withAlpha(80),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.book_outlined,
                color: AppColors.primaryColor,
                size: 26,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Como funciona?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Text(
                    'Digite qualquer ano para descobrir eventos históricos importantes.'
                    'Suas pesquisas são salvas localmente para acesso Offline',
                    maxLines: 6,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Color(0xFF7A6258),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
