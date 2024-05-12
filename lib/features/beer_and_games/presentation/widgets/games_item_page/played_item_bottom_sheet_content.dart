part of 'package:beer_and_games/features/beer_and_games/presentation/pages/games_item_page.dart';

class _PlayedItemBottomSheetContent extends StatefulWidget {
  const _PlayedItemBottomSheetContent({required this.game});

  final Game game;

  @override
  State<_PlayedItemBottomSheetContent> createState() =>
      __PlayedItemBottomSheetContentState();
}

class __PlayedItemBottomSheetContentState
    extends State<_PlayedItemBottomSheetContent> {
  bool? selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'È stato giocato ',
          style: context.textTheme.titleMedium,
        ),
        BlocBuilder<ItemsBloc, ItemsState>(
          buildWhen: (previous, current) {
            return current.maybeMap(
              update: (value) => value.games.any(
                (element) => element.id == widget.game.id,
              ),
              orElse: () => false,
            );
          },
          builder: (context, state) {
            final item = state.maybeMap(
              update: (value) => value.games.firstWhere(
                (element) => element.id == widget.game.id,
              ),
              orElse: () => widget.game,
            );
            return Text(
              item.timesPlayed.toString(),
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
        Text(
          ' volte',
          style: context.textTheme.titleMedium,
        ),
        const Spacer(),
        Row(
          children: [
            _removeButton(context),
            width5,
            _addButton(context),
          ],
        ),
      ],
    );
  }

  Widget _removeButton(BuildContext context) {
    final removed = selected == false;
    return _button(
      context: context,
      title: removed ? 'Rimosso' : 'Rimuovi',
      onPressed: () {
        if (removed) {
          selected = null;
          _incrementPlay();
        } else {
          _decrementPlay();
          if (selected == true) _decrementPlay();
          selected = false;
        }

        setState(() {});
      },
      selected: removed,
    );
  }

  Widget _addButton(BuildContext context) {
    final added = selected == true;
    return _button(
      context: context,
      title: added ? 'Aggiunto' : 'Aggiungi',
      onPressed: () {
        if (added) {
          selected = null;
          _decrementPlay();
        } else {
          _incrementPlay();
          if (selected == false) _incrementPlay();
          selected = true;
        }

        setState(() {});
      },
      selected: added,
    );
  }

  Widget _button({
    required BuildContext context,
    required String title,
    required VoidCallback onPressed,
    required bool selected,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: selected
            ? context.colorScheme.primary
            : MaterialTheme.darkScheme().surfaceContainerLow,
        height: 40,
        child: FilledButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 16),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          child: Text(
            title,
            style: context.textTheme.labelSmall?.copyWith(
              color: selected
                  ? context.colorScheme.onPrimary
                  : context.colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }

  void _incrementPlay() => context
      .read<ItemsBloc>()
      .add(ItemsEvent.updateGamePlay(increment: true, gameId: widget.game.id));

  void _decrementPlay() => context
      .read<ItemsBloc>()
      .add(ItemsEvent.updateGamePlay(increment: false, gameId: widget.game.id));
}
