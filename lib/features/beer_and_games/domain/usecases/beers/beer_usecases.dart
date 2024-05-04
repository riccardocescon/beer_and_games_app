import 'package:beer_and_games/core/beer_and_games/domain/usecases/usecase.dart';
import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/core/enums/rating.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/ratable_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/beer.dart';
import 'package:beer_and_games/features/beer_and_games/domain/repositories/beer_repository.dart';
import 'package:dartz/dartz.dart';

part 'beers_selector.dart';
part 'beer_rating_updater.dart';
