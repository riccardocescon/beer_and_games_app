import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/core/beer_and_games/presentation/bloc/bloc.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/user.dart';
import 'package:beer_and_games/features/beer_and_games/domain/usecases/user/user_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserSigner userSigner;
  final UserGetter userGetter;
  final UserLogout userLogout;

  User? user;

  UserBloc({
    required this.userSigner,
    required this.userGetter,
    required this.userLogout,
  }) : super(const Init()) {
    on<SignIn>((event, emit) async {
      emit(const Loading());
      final result = await userSigner.call(null);
      result.fold(
        (failure) => emit(Error(failure)),
        (user) {
          this.user = user;
          emit(Auth(user));
        },
      );
    });
    on<Get>((event, emit) async {
      emit(const Loading());
      final result = await userGetter.call(event.email);
      result.fold(
        (failure) => emit(Error(failure)),
        (user) {
          this.user = user;
          emit(Auth(user));
        },
      );
    });
    on<Logout>((event, emit) async {
      emit(const Loading());
      final result = await userLogout.call(null);
      result.fold(
        (failure) => emit(Error(failure)),
        (_) {
          user = null;
          emit(const Auth(null));
        },
      );
    });
  }
}
