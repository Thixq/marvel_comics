import 'package:hive_flutter/hive_flutter.dart';

part "comics_model.g.dart";

@HiveType(typeId: 0)
class ComicsModel {
  @HiveField(0)
  final int comicId;
  @HiveField(1)
  final String imagePath;
  @HiveField(2)
  final String comicTitle;
  @HiveField(3)
  final String comicDescription;
  @HiveField(4)
  final String characters;
  @HiveField(5)
  final String creators;
  @HiveField(6)
  final int pageCount;
  @HiveField(7)
  bool isFav;

  ComicsModel({
    required this.comicId,
    required this.imagePath,
    required this.comicTitle,
    required this.comicDescription,
    required this.characters,
    required this.creators,
    required this.pageCount,
    this.isFav = false,
  });

  factory ComicsModel.fromJson(Map<String, dynamic> json) => ComicsModel(
      comicId: json["id"] ?? 0,
      imagePath: json["thumbnail"] != null
          ? json["thumbnail"]["path"] ??
              "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available"
          : "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available",
      comicTitle: json["title"] ?? "",
      comicDescription: json["description"] != ""
          ? json["description"] ?? "Description not available"
          : "Description not available",
      characters: (json["characters"]["items"] as List).isEmpty
          ? "Empty"
          : json["characters"]["items"][0]["name"],
      creators: (json["creators"]["items"] as List).isEmpty
          ? "Empty"
          : json["creators"]["items"][0]["name"],
      pageCount: json['pageCount'] ?? 0);

  ComicsModel copyWith(
          {int? comicId,
          String? imagePath,
          String? comicTitle,
          String? comicDescription,
          String? characters,
          String? creators,
          int? pageCount,
          bool? isFav}) =>
      ComicsModel(
        comicId: comicId ?? this.comicId,
        imagePath: imagePath ?? this.imagePath,
        comicTitle: comicTitle ?? this.comicTitle,
        comicDescription: comicDescription ?? this.comicDescription,
        characters: characters ?? this.characters,
        creators: creators ?? this.creators,
        pageCount: pageCount ?? this.pageCount,
        isFav: isFav ?? this.isFav,
      );
}
