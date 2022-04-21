

import 'package:json_annotation/json_annotation.dart';

import 'MovieModel.dart';

part 'MovieResponseModel.g.dart';

@JsonSerializable()
class MovieResponseModel{
  List<MovieModel> Search=[];

  MovieResponseModel({required this.Search});

  factory MovieResponseModel.fromJson(Map<String,dynamic>json)=> _$MovieResponseModelFromJson(json);
  Map<String,dynamic> toJson()=> _$MovieResponseModelToJson(this);
}