import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/dashboard/Views/dashbord_screen.dart';
import 'features/dashboard/view_models/dashboard_view_model.dart';
import 'features/users/repositories/users_repository.dart';
import 'features/users/services/users_service.dart';
import 'features/users/view_models/users_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Fiamane());
}

class Fiamane extends StatelessWidget {
  const Fiamane({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DashboardViewModel>(
          create: (context) {
            return DashboardViewModel();
          },
        ),
        ChangeNotifierProvider<UsersViewModel>(
          create: (context) {
            /**
             * Dependency injection is used here for testablity, as well as apply the loose coupling
             */
            return UsersViewModel(
              usersRepository: UsersRepository(usersService: UsersService()),
            );
          },
        ),
      ],
      child: const Dashboard(),
    ); 
  }
}
