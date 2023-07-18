import 'package:fiamane/core/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/error_widget.dart';
import '../../../core/widgets/loading_widget.dart';
import '../view_models/users_view_model.dart';
import '../widgets/custom_listTile.dart';

class UsersScreen extends StatefulWidget {
  UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final scrollController = ScrollController();
  late UsersViewModel usersModel;
  @override
  void initState() {
    usersModel = Provider.of<UsersViewModel>(context, listen: false);
    scrollController.addListener(() {
      usersModel.handelInfiniteScroll(scrollController);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: Consumer<UsersViewModel>(builder: (context, model, _) {
        final usersLenght = (model.users.users ?? []).length;
        if (model.isLoading) {
          return LoadingWidget();
        } else if (model.isError) {
          return ErrorWidgets(errorText: model.errorMessage);
        }
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            separatorBuilder: ((context, index) {
              return const SizedBox(height: 10);
            }),
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            itemCount: usersLenght + 1,
            cacheExtent: 1,
            itemBuilder: (BuildContext context, int index) {
              if (index < usersLenght) {
                UserModel user = model.users.users![index];
                return CustomListTile(user: user)
                    .animate()
                    .flipH(perspective: -0.5, begin: 0.3)
                    .fadeIn()
                    .scaleX(begin: 0.5);
              } else {
                if (model.users.totalPages! > model.page) {
                  return LoadingWidget();
                } else {
                  return Container();
                }
              }
            },
          ),
        );
      }),
    );
  }
}
