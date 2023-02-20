import 'package:flutter/cupertino.dart';
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
        child: Transform.scale(
          scale: 1.8,
          child: CupertinoSwitch(
            value: dashboardViewModel.isDark,
            trackColor: Colors.amber,
            thumbColor: Colors.white,
            activeColor: Colors.black,
            onChanged: (value) {
              dashboardViewModel.isDark = value;
            },
          ),
        ),
      ),
    );
  }
}
