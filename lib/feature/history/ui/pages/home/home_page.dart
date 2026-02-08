import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:history_simple_app/core/di/setup_injection.dart';
import 'package:history_simple_app/core/utils/routes/app_routes.dart';
import 'package:history_simple_app/feature/history/ui/pages/home/view_model/home_state.dart';
import 'package:history_simple_app/feature/history/ui/pages/home/view_model/home_view_model.dart';

import '../../components/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeViewModel>(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<HomeViewModel>();

    return BlocListener<HomeViewModel, HomeState>(
      listenWhen: (previous, current) => current.isLoading && !previous.isLoading,
      listener: (context, state) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          builder: (_) {
            return BlocProvider.value(
              value: vm,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  spacing: 16,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '📜 Fato histórico aleatório',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    BlocBuilder<HomeViewModel, HomeState>(
                      builder: (context, state) {
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: state.isLoading || state.randomFact == null
                                ? const CustomLoading(message: 'Buscando um fato histórico...')
                                : Text(
                                    state.randomFact!,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Fatos Históricos',
          subtitle: 'Explore a história por ano',
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 24,
              children: [
                CustomSearchBar(
                  controller: vm.controller,
                  onSearch: () {
                    final year = vm.controller.text;
                    if (year.isNotEmpty) {
                      vm.addSearch();
                      Navigator.pushNamed(
                        context,
                        AppRoutes.RESULTS_SEARCH,
                        arguments: year,
                      );
                    }
                  },
                ),
                InfoCard(),
                BlocBuilder<HomeViewModel, HomeState>(
                  builder: (context, state) => RecentlySearches(
                    searchs: state.searches,
                    onClear: () => vm.clearHistory(),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: vm.newRandomFact,
          child: const Icon(Icons.fact_check),
        ),
      ),
    );
  }
}
