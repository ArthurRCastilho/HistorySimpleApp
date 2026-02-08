import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:history_simple_app/core/di/setup_injection.dart';
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
            if (state.events == null || state.events!.isEmpty) {
              return const Center(
                child: Text('Nenhum evento encontrado nesse ano'),
              );
            }
            return Column(
              children: [
                ResultsHeader(year: year, events: state.events!),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(24),
                    itemCount: state.events!.length,
                    itemBuilder: (context, index) {
                      final event = state.events![index];
                      return Column(
                        children: [
                          EventCard(
                            event: event,
                            year: year,
                            // onTap: () {},
                          ),
                          Divider(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
