import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/widgets/bottom_editable_ratable_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/ratable_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/beer.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/wine.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/items/items_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/hangout_stats_page/hangout_stats_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewRatableItemBody<T extends RateableItem> extends StatefulWidget {
  const NewRatableItemBody({super.key});

  @override
  State<NewRatableItemBody<T>> createState() => _NewRatableItemBodyState<T>();
}

class _NewRatableItemBodyState<T extends RateableItem>
    extends State<NewRatableItemBody<T>> {
  String? name;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ItemsBloc, ItemsState>(
      listenWhen: (previous, current) {
        return current.maybeMap(
          update: (value) {
            if (T == Beer) {
              return value.beers.any((element) => element.name == name);
            } else if (T == Wine) {
              return value.wines.any((element) => element.name == name);
            }

            return false;
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
      child: BottomEditableRatableItem(
        onSave: (name, bytes) {
          if (T == Beer) {
            this.name = name;
            context
                .read<ItemsBloc>()
                .add(ItemsEvent.insertBeer(name: name, imageBytes: bytes));
          } else if (T == Wine) {
            this.name = name;
            context
                .read<ItemsBloc>()
                .add(ItemsEvent.insertWine(name: name, imageBytes: bytes));
          }
        },
      ),
    );
  }
}
