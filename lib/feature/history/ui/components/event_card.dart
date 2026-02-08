import 'package:flutter/material.dart';
import 'package:history_simple_app/core/theme/app_colors.dart';
import 'package:history_simple_app/feature/history/data/models/history_event.dart';
import 'package:history_simple_app/feature/history/ui/components/custom_card.dart';

class EventCard extends StatelessWidget {
  final HistoryEvent event;
  final String year;
  final VoidCallback? onTap;

  const EventCard({
    super.key,
    required this.event,
    required this.year,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomCard(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withAlpha(26),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.auto_stories_rounded,
                color: AppColors.primaryColor,
                size: 26,
              ),
            ),
            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${event.day} de ${event.month}, $year',
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    event.event,
                    style: const TextStyle(
                      color: AppColors.textStrongColor,
                      fontSize: 16,
                      height: 1.4,
                      fontFamily: 'Serif',
                    ),
                  ),
                ],
              ),
            ),

            if (onTap != null)
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: AppColors.secondaryColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
