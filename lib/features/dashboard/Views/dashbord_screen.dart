import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../users/Views/users_screen.dart';
import '../view_models/dashboard_view_model.dart';
import 'change_theme.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  final List<Widget> _children = [
    ChangeTheme(),
    UsersScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardViewModel>(builder: (context, model, _) {
      return MaterialApp(
        theme: ThemeData(
          brightness: (model.isDark) ? Brightness.light : Brightness.dark,
        ),
        home: Scaffold(
          body: Container(
            child: _children[model.currentIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.blue,
            onTap: model.changeCurrentIndex,
            currentIndex: model.currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.color_lens_sharp),
                label: "Theme",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: "Users",
              ),
            ],
          ),
        ),
      );
    });
  }
}
