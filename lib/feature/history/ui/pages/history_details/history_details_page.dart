import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:history_simple_app/core/di/setup_injection.dart';
import 'package:history_simple_app/feature/history/data/models/models.dart';
import 'package:history_simple_app/feature/history/ui/components/custom_app_bar.dart';
import 'package:history_simple_app/feature/history/ui/components/results_header.dart';
import 'package:history_simple_app/feature/history/ui/pages/history_details/view_model/history_details_state.dart';
import 'package:history_simple_app/feature/history/ui/pages/history_details/view_model/history_details_view_model.dart';

class HistoryDetailsPage extends StatelessWidget {
  const HistoryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final history = ModalRoute.of(context)!.settings.arguments as HistoryEvent;
    return Scaffold(
      appBar: CustomAppBar(
        title: history.year,
        subtitle: '${history.day}/${history.month}/${history.year}',
      ),
      body: Column(
        children: [
          BlocProvider(
            create: (_) => getIt<HistoryDetailsViewModel>(),
            child: BlocBuilder<HistoryDetailsViewModel, HistoryDetailsState>(
              builder: (context, state) => ResultsHeader(
                year: history.year,
                isOnline: state.isOnline!,
              ),
            ),
          ),
          Center(
            child: Text(
              history.event,
            ),
          ),
        ],
      ),
    );
  }
}
