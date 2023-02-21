import 'package:fiamane/core/models/users_model.dart';
import 'package:flutter/material.dart';

import '../../../core/errors/error_util.dart';
import '../Repositories/users_repository.dart';

enum UserStatus { loading, success, failure }

class UsersViewModel extends ChangeNotifier {
  final UsersRepository usersRepository;
  UserStatus? userStatus;
  int page = 1;
  String errorMessage = "";
  UsersModel users = UsersModel();
  UsersViewModel({required this.usersRepository}) {
    getUsers();
  }

  void getUsers({bool loading = true}) async {
    if (loading == true) {
      usersStatusSetter = UserStatus.loading;
    }
    final result = await usersRepository.getUsers(page);
    result.fold((failure) {
      usersStatusSetter = UserStatus.failure;
      errorMessage = ErrorUtils.mapFailureToMessage(failure);
    }, (userResponse) {
      users.users ??= [];
      users.users?.addAll(userResponse.users ?? []);
      users.totalPages = userResponse.totalPages;
      usersStatusSetter = UserStatus.success;
    });
  }

  bool get isLoading => userStatus == UserStatus.loading;
  bool get isError => userStatus == UserStatus.failure;

  void handelInfiniteScroll(ScrollController scrollController) {
    if ((scrollController.offset ==
            scrollController.position.maxScrollExtent) &&
        page < users.totalPages!) {
      page++;
      getUsers(loading: false);
    }
  }

  set usersStatusSetter(UserStatus value) {
    userStatus = value;
    notifyListeners();
  }
}
