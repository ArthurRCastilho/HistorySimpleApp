import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:history_simple_app/core/di/setup_injection.dart';
import 'package:history_simple_app/core/utils/routes/app_routes.dart';
import 'package:history_simple_app/feature/history/data/models/history_event.dart';
import 'package:history_simple_app/feature/history/ui/components/components.dart';
import 'package:history_simple_app/feature/history/ui/pages/search_result/view_model/results_state.dart';
import 'package:history_simple_app/feature/history/ui/pages/search_result/view_model/results_view_model.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final year = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (_) => getIt<ResultsViewModel>()..fetchResults(year),
      child: Scaffold(
        appBar: CustomAppBar(),
        body: BlocBuilder<ResultsViewModel, ResultsState>(
          builder: (context, state) {
            if (state.isLoading) return const CustomLoading();
            return Column(
              children: [
                ResultsHeader(
                  year: year,
                  events: state.events ?? [],
                  isOnline: state.isOnline,
                ),
                Expanded(
                  child: state.events == null || state.events!.isEmpty
                      ? Center(child: Text('Nenhum evento encontrado para este ano.'))
                      : BuildListView(year: year, events: state.events!),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class BuildListView extends StatelessWidget {
  final String year;
  final List<HistoryEvent> events;
  const BuildListView({
    super.key,
    required this.year,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(24),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return Column(
          children: [
            EventCard(
              event: event,
              year: year,
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.EVENT_DETAILS, arguments: event);
              },
            ),
            Divider(),
          ],
        );
      },
    );
  }
}
