import 'package:beer_and_games/features/beer_and_games/domain/entities/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc {
  late User user;

  UserBloc() : super(null) {
    user = User(email: 'riccardo.cescon.developer@gmail.com');
  }
}
