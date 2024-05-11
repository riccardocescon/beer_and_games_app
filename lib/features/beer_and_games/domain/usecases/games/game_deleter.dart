part of 'games_usecases.dart';

class GameInserter extends UseCase<void, GameInserterParams> {
  final GameRepository gameRepository;

  GameInserter({required this.gameRepository});

  @override
  Future<Either<Failure, void>> call(GameInserterParams params) async {
    return await gameRepository.insert(
      name: params.name,
      imageBytes: params.imageBytes,
      minPlayers: params.minPlayers,
      maxPlayers: params.maxPlayers,
      onlyMinMaxPlayers: params.onlyMinMaxPlayers,
    );
  }
}

class GameInserterParams {
  final String name;
  final List<int>? imageBytes;
  final int minPlayers;
  final int maxPlayers;
  final bool onlyMinMaxPlayers;

  GameInserterParams({
    required this.name,
    required this.imageBytes,
    required this.minPlayers,
    required this.maxPlayers,
    required this.onlyMinMaxPlayers,
  });
}
