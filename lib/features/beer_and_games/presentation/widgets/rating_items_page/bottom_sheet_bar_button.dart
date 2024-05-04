part of 'package:beer_and_games/features/beer_and_games/presentation/pages/rating_items_page.dart';

class _BottomSheetBarButton extends StatefulWidget {
  const _BottomSheetBarButton({required this.item, required this.rating});

  final RateableItem item;
  final Rating rating;

  @override
  State<_BottomSheetBarButton> createState() => __BottomSheetBarButtonState();
}

class __BottomSheetBarButtonState extends State<_BottomSheetBarButton>
    with SingleTickerProviderStateMixin {
  User get _me => sl<UserBloc>().user!;

  double get topLeft => widget.rating == Rating.hate ? 24.0 : 0.0;
  double get bottomLeft => widget.rating == Rating.hate ? 24.0 : 0.0;
  double get topRight => widget.rating == Rating.love ? 24.0 : 0.0;
  double get bottomRight => widget.rating == Rating.love ? 24.0 : 0.0;
  bool get votedByMe => widget.item.ratings.any((element) =>
      element.userEmail == _me.email && element.rating == widget.rating);

  bool wasVoted = false;

  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late final Animation<Color?> _colorTween = ColorTween(
    begin: widget.rating.backgroundColor,
    end: widget.rating.color,
  ).animate(_controller);

  @override
  void initState() {
    if (votedByMe) {
      _controller.forward();
      wasVoted = true;
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocListener<ItemsBloc, ItemsState>(
        listener: (context, state) {
          state.maybeMap(
            update: (value) {
              if (wasVoted) {
                wasVoted = false;
                _controller.reverse();
              }

              if (votedByMe) {
                wasVoted = true;
                _controller.forward();
              }
            },
            orElse: () {},
          );
        },
        child: AnimatedBuilder(
          animation: _colorTween,
          builder: (context, child) {
            return FilledButton(
              onPressed: () {
                context.read<ItemsBloc>().add(
                      ItemsEvent.updateRating(
                        item: widget.item,
                        userEmail: _me.email,
                        rating: widget.rating,
                      ),
                    );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(_colorTween.value),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(topLeft),
                      bottomLeft: Radius.circular(bottomLeft),
                      topRight: Radius.circular(topRight),
                      bottomRight: Radius.circular(bottomRight),
                    ),
                  ),
                ),
              ),
              child: child,
            );
          },
          child: Image.asset(widget.rating.iconPath),
        ),
      ),
    );
  }
}
