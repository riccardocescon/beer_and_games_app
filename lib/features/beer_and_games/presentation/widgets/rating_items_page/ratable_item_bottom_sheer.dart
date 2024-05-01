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
          SizedBox(
            height: _bottomSheetHeigth,
            child: _BottomSheetRatableBar(
              ratings: item.ratings,
              users: _allUsers,
            ),
          ),
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
}
