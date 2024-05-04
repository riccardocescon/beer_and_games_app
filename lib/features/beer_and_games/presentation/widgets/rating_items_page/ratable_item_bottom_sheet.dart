part of 'package:beer_and_games/features/beer_and_games/presentation/pages/rating_items_page.dart';

class _RatableItemBottomSheet extends StatelessWidget {
  const _RatableItemBottomSheet({required this.item});

  final RateableItem item;

  final _titleHeigth = 80.0;
  final _bottomSheetHeigth = 100.0;
  final _padding = 32.0;

  List<User> get _allUsers => sl<HangoutBloc>().hangout!.allUsers;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: _titleHeigth + _bottomSheetHeigth + 20 + _padding * 2,
      padding: EdgeInsets.all(_padding),
      child: Column(
        children: [
          _titleIcon(context),
          height20,
          _bottomContent(),
        ],
      ),
    );
  }

  Widget _titleIcon(BuildContext context) {
    return SizedBox(
      height: _titleHeigth,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                Text(
                  'Assegna un voto per dire quanti ti è piaciuta\n'
                  'Puoi cambiare il tuo voto in momento qualsiasi',
                  style: context.textTheme.labelSmall,
                )
              ],
            ),
          ),
          item.imageBytes == null
              ? const SizedBox.shrink()
              : Image.memory(item.imageBytes!),
        ],
      ),
    );
  }

  Widget _bottomContent() {
    return SizedBox(
      height: _bottomSheetHeigth,
      child: BlocBuilder<ItemsBloc, ItemsState>(
        buildWhen: (previous, current) {
          return current.maybeMap(
            update: (value) {
              final prev = previous.maybeMap(
                update: (value) => value,
                orElse: () => null,
              );
              if (prev == null) return true;

              final prevValues = item is Beer ? prev.beers : prev.wines;
              final currentValues = item is Beer ? value.beers : value.wines;

              final prevValue = prevValues
                  .firstWhereOrNull((element) => element.id == item.id);
              if (prevValue == null) return true;

              final currentValue = currentValues
                  .firstWhereOrNull((element) => element.id == item.id);
              return currentValue != prevValue;
            },
            orElse: () => false,
          );
        },
        builder: (context, state) {
          return state.maybeMap(
            update: (value) {
              return _BottomSheetRatableBar(
                item: item,
                users: _allUsers,
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
