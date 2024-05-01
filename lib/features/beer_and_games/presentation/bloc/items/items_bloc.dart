import 'dart:developer';

import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/core/beer_and_games/presentation/bloc/bloc.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/beer.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/game.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/wine.dart';
import 'package:beer_and_games/features/beer_and_games/domain/usecases/beers/beers_selector.dart';
import 'package:beer_and_games/features/beer_and_games/domain/usecases/games/games_selector.dart';
import 'package:beer_and_games/features/beer_and_games/domain/usecases/wines/wines_selector.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'items_bloc.freezed.dart';
part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  final GamesSelector gamesSelector;
  final BeersSelector beersSelector;
  final WinesSelector winesSelector;

  ItemsBloc({
    required this.gamesSelector,
    required this.beersSelector,
    required this.winesSelector,
  }) : super(const ItemsState.init()) {
    on<Download>((event, emit) async {
      List<Game> games = [];
      List<Beer> beers = [];
      List<Wine> wines = [];

      emit(const ItemsState.loading());

      final gameSubscription = gamesSelector.call(null).listen((event) {
        event.fold(
          (l) {
            log('Error downloading games: ${l.toString()}');
          },
          (g) {
            log('Downlaoded games: ${games.map((e) => e.name).toList()}');
            games = g;
            emit(
              ItemsState.update(
                games: games.map((e) => e.copyWith()).toList(),
                beers: beers.map((e) => e.copyWith()).toList(),
                wines: wines.map((e) => e.copyWith()).toList(),
              ),
            );
          },
        );
      });

      final beerSubscription = beersSelector.call(null).listen((event) {
        event.fold(
          (l) {
            log('Error downloading beers: ${l.toString()}');
          },
          (b) {
            log('Downlaoded beers: ${beers.map((e) => e.name).toList()}');
            beers = b.toList();
            emit(
              ItemsState.update(
                games: games.map((e) => e.copyWith()).toList(),
                beers: beers.map((e) => e.copyWith()).toList(),
                wines: wines.map((e) => e.copyWith()).toList(),
              ),
            );
          },
        );
      });

      final wineSubscription = winesSelector.call(null).listen((event) {
        event.fold(
          (l) {
            log('Error downloading wines: ${l.toString()}');
          },
          (w) {
            log('Downlaoded wines: ${beers.map((e) => e.name).toList()}');
            wines = w.toList();
            emit(
              ItemsState.update(
                games: games.map((e) => e.copyWith()).toList(),
                beers: beers.map((e) => e.copyWith()).toList(),
                wines: wines.map((e) => e.copyWith()).toList(),
              ),
            );
          },
        );
      });

      await Future.wait(
        [
          gameSubscription.asFuture(),
          beerSubscription.asFuture(),
          wineSubscription.asFuture(),
        ],
      );
    });
  }
}
