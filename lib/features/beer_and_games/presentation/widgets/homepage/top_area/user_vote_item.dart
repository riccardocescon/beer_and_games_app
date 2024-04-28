part of 'top_area.dart';

class _UserVoteItem extends StatefulWidget {
  const _UserVoteItem({
    required this.users,
    required this.backgroundColor,
    required this.avatarColor,
    required this.onAvatarColor,
    required this.maxWidth,
  });

  final List<User> users;
  final Color backgroundColor;
  final Color avatarColor;
  final Color onAvatarColor;
  final double maxWidth;

  @override
  State<_UserVoteItem> createState() => _UserVoteItemState();
}

class _UserVoteItemState extends State<_UserVoteItem>
    with SingleTickerProviderStateMixin {
  final _avatarSize = 20.0;
  final _avatarPadding = 4.0;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late Animation<double> _animation;

  bool _expand = false;

  @override
  void initState() {
    _animation = Tween<double>(
      begin: 30,
      end: 60,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SizedBox(
          height: _animation.value,
          child: child,
        );
      },
      child: FilledButton(
        onPressed: () {
          if (_expand) {
            _controller.reverse();
          } else {
            _controller.forward();
          }

          _expand = !_expand;
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
          ),
          backgroundColor: MaterialStateProperty.all(widget.backgroundColor),
        ),
        child: LayoutBuilder(
          builder: (_, __) {
            return _expand ? _expandedItems() : _compactItems(widget.maxWidth);
          },
        ),
      ),
    );
  }

  Widget _animatedItem({required Widget child}) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      switchInCurve: Curves.easeInOutCubic,
      switchOutCurve: Curves.easeInOutCubic,
      child: child,
    );
  }

  //#region Layouts
  Widget _compactItems(double maxWidth) {
    final maxAvatars = maxWidth ~/ (_avatarSize + _avatarPadding);
    final items = min(widget.users.length, maxAvatars);
    final alignment =
        widget.users.length != maxAvatars && widget.users.length < maxAvatars
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceEvenly;
    return Row(
      mainAxisAlignment: alignment,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        maxAvatars,
        (index) {
          final isOverflow =
              index == maxAvatars - 1 && widget.users.length > maxAvatars;

          final showItem = index < items;

          final item = !showItem
              ? const SizedBox.shrink()
              : isOverflow
                  ? _maxAvatar(context, widget.users.length - maxAvatars + 1)
                  : _userAvatar(context, widget.users[index], false);

          return _animatedItem(child: item);
        },
      ),
    );
  }

  Widget _expandedItems() {
    final maxAvatars = widget.maxWidth ~/ (_avatarSize + _avatarPadding) * 2;
    final items = min(widget.users.length, maxAvatars);
    return Wrap(
      spacing: 0,
      runSpacing: 4,
      children: List.generate(maxAvatars, (index) {
        final isOverflow =
            index == maxAvatars - 1 && widget.users.length > maxAvatars;

        final showItem = index < items;

        final child = !showItem
            ? const SizedBox.shrink()
            : isOverflow
                ? _maxAvatar(
                    context,
                    widget.users.length - maxAvatars + 1,
                  )
                : _userAvatar(
                    context,
                    widget.users[index],
                    index == 0 || index == maxAvatars ~/ 2,
                  );

        return _animatedItem(child: child);
      }),
    );
  }
  //#endregion

  //#region Avatars
  Widget _userAvatar(
    BuildContext context,
    User user,
    bool isFirst,
  ) {
    return _avatar(
      margin: isFirst ? null : _avatarPadding,
      text: user.letters,
    );
  }

  Widget _maxAvatar(
    BuildContext context,
    int overflow,
  ) {
    return _avatar(
      margin: _avatarPadding,
      text: '+$overflow',
    );
  }

  Widget _avatar({
    required double? margin,
    required String text,
  }) {
    return Container(
      height: _avatarSize,
      width: _avatarSize,
      margin: margin != null ? EdgeInsets.only(left: margin) : null,
      decoration: BoxDecoration(
        color: widget.avatarColor,
        borderRadius: const BorderRadius.all(Radius.circular(64)),
      ),
      padding: const EdgeInsets.all(4),
      child: Center(
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(
              color: widget.onAvatarColor,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
  //#endregion
}
