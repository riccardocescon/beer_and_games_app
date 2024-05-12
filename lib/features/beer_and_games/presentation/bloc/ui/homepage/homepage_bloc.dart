import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/core/beer_and_games/presentation/bloc/bloc.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/beer.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/game.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/hangout.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/wine.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/hangout/hangout_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/items/items_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'homepage_bloc.freezed.dart';
part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  final HangoutBloc hangoutBloc;
  late ItemsBloc itemsBloc;
  bool _showingGames = false;

  List<Game>? _games;

  List<Game> get _filteredGames {
    if (_games == null || _games!.isEmpty) return [];
    if (hangoutBloc.hangout == null ||
        hangoutBloc.hangout!.presentUsers.isEmpty) return [];

    final presenceUsers = hangoutBloc.hangout!.presentUsers.length;
    final filtered = _games!
        .where((element) =>
            presenceUsers >= element.minPlayers &&
            presenceUsers <= element.maxPlayers)
        .toList();

    return filtered;
  }

  HomepageBloc({
    required this.hangoutBloc,
  }) : super(const HomepageState.init()) {
    on<Setup>((event, emit) async {
      emit(const HomepageState.loading());
      hangoutBloc.add(const HangoutEvent.select());

      await for (final state in hangoutBloc.stream) {
        state.maybeMap(
          loaded: (value) {
            emit(HomepageState.loaded(value.hangout));
          },
          dateTimeUpdate: (value) {
            String date =
                DateFormat('EEEE dd MMMM', 'it_IT').format(value.date);
            final parts = date.split(' ');
            final day = int.parse(parts[1]);
            date =
                '${parts[0][0].toUpperCase()}${parts[0].substring(1)} $day ${parts[2][0].toUpperCase()}${parts[2].substring(1)}';

            final missingDays = value.missingDays;
            final missingDaysWord = missingDays > 1 ? 'Giorni' : 'Giorno';
            final missingHours = value.missingHours;
            final missingHoursWord = missingHours > 1 ? 'Ore' : 'Ora';
            final missingMinutes = value.missingMinutes;
            final completeTime =
                '$missingDays $missingDaysWord $missingHours $missingHoursWord $missingMinutes Minuti';

            emit(
              HomepageState.dateTimeUpdate(
                date: date,
                timeLeft: completeTime,
              ),
            );
          },
          error: (value) {
            emit(HomepageState.error(value.failure));
          },
          orElse: () {},
        );
      }
    });
    on<SetupGameStream>((event, emit) async {
      itemsBloc = event.itemsBloc;
      await for (final state in itemsBloc.stream) {
        final foGames = state.maybeMap(
          update: (value) => value.games,
          orElse: () => null,
        );
        if (foGames == null) continue;

        _games = foGames;
      }
    });
    on<ShowGames>((event, emit) async {
      if (event.onlyRefresh && !_showingGames) return;

      if (_showingGames && !event.onlyRefresh) {
        _showingGames = false;

        emit(const HomepageState.showGames(games: null, isDownloading: false));
        return;
      }

      _showingGames = true;

      if (_games == null) {
        emit(const HomepageState.showGames(games: [], isDownloading: true));
        itemsBloc.add(const ItemsEvent.download());
        await for (final state in itemsBloc.stream) {
          final foGames = state.maybeMap(
            update: (value) => value.games,
            orElse: () => null,
          );
          if (foGames == null) continue;

          _games = foGames;
          break;
        }
      }

      final filteredGames = _filteredGames;

      emit(
        HomepageState.showGames(games: filteredGames, isDownloading: false),
      );
    });
  }
}
