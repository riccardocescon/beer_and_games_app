part of 'package:beer_and_games/features/beer_and_games/presentation/pages/rating_items_page.dart';

class _RatableItemBottomSheet extends StatelessWidget {
  const _RatableItemBottomSheet({required this.item});

  final RateableItem item;

  final _bottomSheetHeigth = 100.0;

  List<User> get _allUsers => sl<HangoutBloc>().hangout!.allUsers;

  @override
  Widget build(BuildContext context) {
    return ItemBottomSheet(
      item: item,
      description: 'Assegna un voto per dire quanti ti è piaciuta\n'
          'Puoi cambiare il tuo voto in momento qualsiasi',
      bottomSheetHeigth: _bottomSheetHeigth,
      child: _bottomContent(),
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
