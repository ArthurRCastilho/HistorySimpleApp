import 'package:flutter/material.dart';
import 'package:history_simple_app/core/theme/app_theme.dart';
import 'package:history_simple_app/core/utils/routes/app_routes.dart';
import 'package:history_simple_app/feature/history/ui/pages/pages.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fatos Históricos',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.HOME,
      routes: {
        AppRoutes.HOME: (context) => const HomePage(),
        AppRoutes.RESULTS_SEARCH: (context) => const SearchResultPage(),
        AppRoutes.EVENT_DETAILS: (context) => const HistoryDetailsPage(),
      },
    );
  }
}
