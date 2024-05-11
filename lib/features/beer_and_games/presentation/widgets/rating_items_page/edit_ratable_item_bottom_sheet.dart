import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/widgets/bottom_editable_ratable_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/ratable_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/beer.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/wine.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/items/items_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditRatableItemBottomSheet extends StatefulWidget {
  const EditRatableItemBottomSheet({super.key, required this.item});

  final RateableItem item;

  @override
  State<EditRatableItemBottomSheet> createState() =>
      _EditRatableItemBottomSheetState();
}

class _EditRatableItemBottomSheetState
    extends State<EditRatableItemBottomSheet> {
  late RateableItem _backupItem = widget.item is Beer
      ? (widget.item as Beer).copyWith()
      : (widget.item as Wine).copyWith();

  void _update(String name, List<int> image) {
    if (_backupItem is Beer) {
      _backupItem = (_backupItem as Beer)
          .copyWithDontOverrideNullable(name: name, imageBytes: image);
    } else if (_backupItem is Wine) {
      _backupItem =
          (_backupItem as Wine).copyWith(name: name, imageBytes: image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ItemsBloc, ItemsState>(
      listenWhen: (previous, current) {
        return current.maybeMap(
          update: (value) {
            final prevValue = previous.maybeMap(
              update: (value) => value,
              orElse: () => null,
            );
            if (prevValue == null) return true;

            if (widget.item is Beer) {
              final prevBeer = prevValue.beers
                  .firstWhere((element) => element.id == widget.item.id);
              final beer = value.beers
                  .firstWhere((element) => element.id == widget.item.id);
              return beer != prevBeer && beer == _backupItem;
            } else {
              final prevWine = prevValue.wines
                  .firstWhere((element) => element.id == widget.item.id);
              final wine = value.wines
                  .firstWhere((element) => element.id == widget.item.id);
              return wine != prevWine && wine == _backupItem;
            }
          },
          orElse: () => false,
        );
      },
      listener: (context, state) {
        state.maybeMap(
          update: (value) {
            context.pop();
            context.successSnackbar(
              'Modifica effettuata',
              'Le modifiche sono state apportate con successo',
            );
          },
          orElse: () {},
        );
      },
      child: BottomEditableItem(
        initName: widget.item.name,
        initImageBytes: widget.item.imageBytes?.toList(),
        onSave: (name, bytes) {
          _update(name, bytes ?? <int>[]);
          context.read<ItemsBloc>().add(
                ItemsEvent.updateInfo(item: _backupItem),
              );
        },
      ),
    );
  }
}
