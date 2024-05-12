import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/widgets/spacers.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/item.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/items/items_bloc.dart';
import 'package:beer_and_games/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin EditDeleteItemMenuPoppable {
  Offset? _tapPosition;

  void storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }

  void handleLongPress({
    required BuildContext context,
    required Item updatedItem,
    required Widget Function(Update item) onShowModalBottomSheet,
  }) {
    final overlay =
        Overlay.of(context).context.findRenderObject()! as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        // smaller rect, the touch area
        _tapPosition! & const Size(40, 40),

        // Bigger rect, the entire screen
        Offset.zero & overlay.size,
      ),
      items: [
        PopupMenuItem(
          value: 1,
          height: 32,
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => BlocProvider.value(
                value: context.read<ItemsBloc>(),
                child: BlocBuilder<ItemsBloc, ItemsState>(
                  buildWhen: (previous, current) => current.maybeMap(
                    update: (value) => true,
                    orElse: () => false,
                  ),
                  builder: (_, state) {
                    return state.maybeMap(
                      update: (value) => onShowModalBottomSheet(value),
                      orElse: () => const SizedBox(),
                    );
                  },
                ),
              ),
              backgroundColor: MaterialTheme.darkScheme().surfaceContainer,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
            );
          },
          child: Row(
            children: [
              Icon(
                Icons.edit_rounded,
                color: context.colorScheme.onSurface,
                size: context.textTheme.bodyLarge?.fontSize,
              ),
              width10,
              Text(
                'Modifica',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          height: 32,
          onTap: () {
            context
                .showSimpleChoiceDialog(
              'Eliminazione',
              'Sei sicuro di voler eliminare questo elemento?\n'
                  'Questa azione è irreversibile.',
              positiveAction: 'Elimina',
              negativeAction: 'Annulla',
              titleColor: context.colorScheme.tertiary,
              positiveActionColor: context.colorScheme.tertiary,
              negativeActionColor: context.colorScheme.primary,
            )
                .then((decision) {
              if (decision != true) return;

              context
                  .read<ItemsBloc>()
                  .add(ItemsEvent.delete(item: updatedItem));
            });
          },
          child: Row(
            children: [
              Icon(
                Icons.delete_rounded,
                color: context.colorScheme.tertiary,
                size: context.textTheme.bodyLarge?.fontSize,
              ),
              width10,
              Text(
                'Elimina',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.tertiary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
