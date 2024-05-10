class GameModel {
  final String id;
  final String name;
  final int minPlayers, maxPlayers;
  final bool onlyMinMaxPlayers;
  final String? imageUrl;

  GameModel._({
    required this.id,
    required this.name,
    required this.minPlayers,
    required this.maxPlayers,
    required this.onlyMinMaxPlayers,
    this.imageUrl,
  });

  factory GameModel.fromJson(Map<String, dynamic> json, {required String id}) {
    return GameModel._(
      id: id,
      name: json['name'],
      minPlayers: json['min_p'],
      maxPlayers: json['max_p'],
      onlyMinMaxPlayers: json['only_mm'],
      imageUrl: json['img'],
    );
  }
}
