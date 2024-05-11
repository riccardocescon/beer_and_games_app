import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/widgets/bottom_editable_game_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/ratable_item.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/items/items_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/hangout_stats_page/hangout_stats_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewGameItemBody extends StatefulWidget {
  const NewGameItemBody({super.key});

  @override
  State<NewGameItemBody> createState() => _NewGameItemBodyState();
}

class _NewGameItemBodyState<T extends RateableItem>
    extends State<NewGameItemBody> {
  String? name;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ItemsBloc, ItemsState>(
      listenWhen: (previous, current) {
        return current.maybeMap(
          update: (value) {
            return !value.games.any((element) => element.name == name);
          },
          orElse: () => false,
        );
      },
      listener: (context, state) {
        state.maybeMap(
          update: (value) {
            context.read<HangoutStatsPageBloc>().add(
                  const HangoutStatsPageEvent.closeItem(),
                );
            context.successSnackbar(
              'Successo',
              'Elemento aggiunto con successo!',
            );
          },
          orElse: () {},
        );
      },
      child: BottomEditableGameItem(
        onSave: (name, bytes, minPlayers, maxPlayers, onlyMinMaxPlayers) {
          context.read<ItemsBloc>().add(
                ItemsEvent.insertGame(
                  name: name,
                  imageBytes: bytes,
                  minPlayers: minPlayers,
                  maxPlayers: maxPlayers,
                  onlyMinMaxPlayers: onlyMinMaxPlayers,
                ),
              );
        },
      ),
    );
  }
}
