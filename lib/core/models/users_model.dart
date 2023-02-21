import 'package:fiamane/core/models/support_model.dart';
import 'package:fiamane/core/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_model.g.dart';

@JsonSerializable()
class UsersModel {
  int? page;
  @JsonKey(name: 'per_page')
  int? perPage;
  int? total;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'data')
  List<UserModel>? users;
  SupportModel? support;

  UsersModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.users,
    this.support,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);
  Map<String, dynamic> toJson() => _$UsersModelToJson(this);
}
