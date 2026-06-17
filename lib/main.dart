import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helper_functions.dart/on_generate_routes.dart';
import 'package:fruits_hub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';

void main() {
  runApp(const FruitHubDashBoard());
}

class FruitHubDashBoard extends StatelessWidget {
  const FruitHubDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: DashboardView.routeName,
    );
  }
}
