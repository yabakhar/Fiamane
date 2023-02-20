import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/dashboard_view_model.dart';

class ChangeTheme extends StatelessWidget {
  ChangeTheme({super.key});
  late DashboardViewModel dashboardViewModel;
  late Size size;
  @override
  Widget build(BuildContext context) {
    dashboardViewModel = Provider.of<DashboardViewModel>(context);
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Change Theme")),
      body: Container(
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            dashboardViewModel.isDark = !dashboardViewModel.isDark;
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            alignment: Alignment.center,
            height: 50,
            width: size.width / 3,
            child: Text(
              (dashboardViewModel.isDark) ? "Dark Mode" : "Light Mode",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
