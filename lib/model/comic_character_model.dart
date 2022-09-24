class ComicCharacterModel {
  final int characterId;
  final String name;
  final String description;
  final String imagePath;
  final int comicsCount;

  ComicCharacterModel(
      {required this.characterId,
      required this.name,
      required this.description,
      required this.imagePath,
      required this.comicsCount});

  factory ComicCharacterModel.fromJson(Map<String, dynamic> json) =>
      ComicCharacterModel(
          characterId: json["id"] ?? 0,
          name: json["name"] ?? '',
          description: json['description'] ?? 'description not available',
          imagePath: json['thumbnail']['path'] ??
              'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available',
          comicsCount: json['comics']['available'] ?? 0);
}
