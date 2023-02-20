import 'package:json_annotation/json_annotation.dart';

part 'support_model.g.dart';

@JsonSerializable()
class SupportModel {
  String? url;
  String? text;

  SupportModel({this.url, this.text});

  factory SupportModel.fromJson(Map<String, dynamic> json) =>
      _$SupportModelFromJson(json);
  Map<String, dynamic> toJson() => _$SupportModelToJson(this);
}
