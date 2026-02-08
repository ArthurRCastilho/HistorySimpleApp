import 'package:flutter/material.dart';
import 'package:history_simple_app/core/theme/app_colors.dart';
import 'package:history_simple_app/feature/history/data/models/history_event.dart';

class ResultsHeader extends StatelessWidget {
  const ResultsHeader({
    super.key,
    required this.year,
    this.events,
    this.isOnline = false,
  });

  final String year;
  final List<HistoryEvent>? events;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              final canPop = Navigator.canPop(context);
              if (canPop) Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  year,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Row(
                  spacing: 8,
                  children: [
                    Icon(
                      isOnline ? Icons.cloud_done_rounded : Icons.storage_rounded,
                      color: AppColors.secondaryColor,
                    ),
                    Text(
                      isOnline ? 'Buscado da internet' : 'Do cache Local',
                      style: TextStyle(color: AppColors.secondaryColor),
                    ),
                    if (events != null && events!.isNotEmpty)
                      Text(
                        '${events!.length} fatos',
                        style: TextStyle(
                          color: AppColors.textLightColor,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
