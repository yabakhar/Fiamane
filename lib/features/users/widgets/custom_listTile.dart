import 'package:fiamane/core/models/user_model.dart';
import 'package:flutter/material.dart';
import '../../../core/data/const.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile({super.key, required this.user});
  UserModel user;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox.fromSize(
          size: const Size.fromRadius(35),
          child: Image.network(
            user.avatar ?? placeHolderImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
      subtitle: Text(user.email ?? ""),
      title: Text("${user.firstName ?? ""} ${user.lastName ?? ""}"),
    );
  }
}
