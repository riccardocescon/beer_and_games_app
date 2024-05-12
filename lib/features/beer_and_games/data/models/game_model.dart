class GameModel {
  final String id;
  final String name;
  final int minPlayers, maxPlayers;
  final bool onlyMinMaxPlayers;
  final String? imageUrl;
  final int timesPlayed;

  GameModel._({
    required this.id,
    required this.name,
    required this.minPlayers,
    required this.maxPlayers,
    required this.onlyMinMaxPlayers,
    required this.timesPlayed,
    this.imageUrl,
  });

  factory GameModel.fromJson(Map<String, dynamic> json, {required String id}) {
    return GameModel._(
      id: id,
      name: json['name'],
      minPlayers: json['min_p'],
      maxPlayers: json['max_p'],
      onlyMinMaxPlayers: json.containsKey('only_mm') ? json['only_mm'] : false,
      imageUrl: json['img'],
      timesPlayed: json.containsKey('times') ? json['times'] : 0,
    );
  }
}
