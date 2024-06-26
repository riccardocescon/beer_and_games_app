import 'dart:developer';

import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/core/beer_and_games/presentation/bloc/bloc.dart';
import 'package:beer_and_games/core/enums/rating.dart';
import 'package:beer_and_games/core/extentions/either_extensions.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/ratable_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/beer.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/game.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/wine.dart';
import 'package:beer_and_games/features/beer_and_games/domain/usecases/beers/beer_usecases.dart';
import 'package:beer_and_games/features/beer_and_games/domain/usecases/games/games_usecases.dart';
import 'package:beer_and_games/features/beer_and_games/domain/usecases/wines/wine_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'items_bloc.freezed.dart';
part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  final GamesSelector gamesSelector;
  final GamePlayIncrementor gamePlayIncrementor;
  final GamePlayDecrementor gamePlayDecrementor;
  final GameInserter gameInserter;
  final GameInfoUpdater gameInfoUpdater;
  final GameDeleter gameDeleter;
  final BeersSelector beersSelector;
  final BeerInserter beerInserter;
  final BeersRatiningUpdater beersRatiningUpdater;
  final BeerInfoUpdater beerInfoUpdater;
  final BeerDeleter beerDeleter;
  final WinesSelector winesSelector;
  final WineInserter wineInserter;
  final WineRatingUpdates wineRatingUpdates;
  final WineInfoUpdater wineInfoUpdater;
  final WineDeleter wineDeleter;

  ItemsBloc({
    required this.gamesSelector,
    required this.gamePlayIncrementor,
    required this.gamePlayDecrementor,
    required this.gameInserter,
    required this.gameInfoUpdater,
    required this.gameDeleter,
    required this.beersSelector,
    required this.beerInserter,
    required this.beersRatiningUpdater,
    required this.beerInfoUpdater,
    required this.beerDeleter,
    required this.winesSelector,
    required this.wineInserter,
    required this.wineRatingUpdates,
    required this.wineInfoUpdater,
    required this.wineDeleter,
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
            log('Downlaoded wines: ${wines.map((e) => e.name).toList()}');
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

    on<InsertGame>((event, emit) async {
      final result = await gameInserter.call(
        GameInserterParams(
          name: event.name,
          imageBytes: event.imageBytes,
          minPlayers: event.minPlayers,
          maxPlayers: event.maxPlayers,
          onlyMinMaxPlayers: event.onlyMinMaxPlayers,
        ),
      );
      if (result.isLeft()) {
        emit(ItemsState.error(result.left));
      }
    });
    on<InsertBeer>((event, emit) async {
      final result = await beerInserter.call(
        BeerInserterParams(
          name: event.name,
          imageBytes: event.imageBytes,
        ),
      );
      if (result.isLeft()) {
        emit(ItemsState.error(result.left));
      }
    });
    on<InsertWine>((event, emit) async {
      final result = await wineInserter.call(
        WineInserterParams(
          name: event.name,
          imageBytes: event.imageBytes,
        ),
      );
      if (result.isLeft()) {
        emit(ItemsState.error(result.left));
      }
    });

    on<UpdateGameInfo>((event, emit) async {
      final result = await gameInfoUpdater.call(
        GameInfoUpdaterParams(game: event.item),
      );
      if (result.isLeft()) {
        emit(ItemsState.error(result.left));
      }
    });
    on<UpdateRating>((event, emit) async {
      final item = event.item;
      final rating = event.rating;
      final userEmail = event.userEmail;
      final remove = event.removeVote;

      if (item is Beer) {
        final result = await beersRatiningUpdater.call(
          BeerRatingUpdatedParams(
            item: item,
            rating: rating,
            userEmail: userEmail,
            remove: remove,
          ),
        );
        if (result.isLeft()) {
          emit(ItemsState.error(result.left));
        }
      } else if (item is Wine) {
        final result = await wineRatingUpdates.call(
          WineRatingUpdatedParams(
            item: item,
            rating: rating,
            userEmail: userEmail,
            remove: remove,
          ),
        );
        if (result.isLeft()) {
          emit(ItemsState.error(result.left));
        }
      }
    });
    on<UpdateInfo>((event, emit) async {
      if (event.item is Beer) {
        final foUpdate = await beerInfoUpdater.call(
          BeerInfoUpdaterParams(beer: event.item as Beer),
        );
        if (foUpdate.isLeft()) {
          emit(ItemsState.error(foUpdate.left));
          return;
        }
      } else if (event.item is Wine) {
        final foUpdate = await wineInfoUpdater.call(
          WineInfoUpdaterParams(wine: event.item as Wine),
        );
        if (foUpdate.isLeft()) {
          emit(ItemsState.error(foUpdate.left));
          return;
        }
      }
    });
    on<UpdateGamePlay>((event, emit) async {
      if (event.increment) {
        final foIncrement = await gamePlayIncrementor.call(
          GamePlayIncrementorParams(gameId: event.gameId),
        );
        if (foIncrement.isLeft()) {
          emit(ItemsState.error(foIncrement.left));
          return;
        }
      } else {
        final foDecrement = await gamePlayDecrementor.call(
          GamePlayDecrementorParams(gameId: event.gameId),
        );
        if (foDecrement.isLeft()) {
          emit(ItemsState.error(foDecrement.left));
          return;
        }
      }
    });

    on<Delete>((event, emit) async {
      if (event.item is Beer) {
        final foDelete = await beerDeleter.call(
          BeerInfoUpdaterParams(beer: event.item as Beer),
        );
        if (foDelete.isLeft()) {
          emit(ItemsState.error(foDelete.left));
          return;
        }
      } else if (event.item is Wine) {
        final foDelete = await wineDeleter.call(
          WineInfoUpdaterParams(wine: event.item as Wine),
        );
        if (foDelete.isLeft()) {
          emit(ItemsState.error(foDelete.left));
          return;
        }
      } else if (event.item is Game) {
        final foDelete = await gameDeleter.call(
          GameDeleterParams(game: event.item as Game),
        );
        if (foDelete.isLeft()) {
          emit(ItemsState.error(foDelete.left));
          return;
        }
      }
    });
  }
}
