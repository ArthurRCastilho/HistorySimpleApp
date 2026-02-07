import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:history_simple_app/core/di/setup_injection.dart';
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
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.read<HomeViewModel>();
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 24,
            children: [
              CustomSearchBar(
                controller: vm.controller,
                onSearch: () => vm.addSearch(),
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
    );
  }
}
