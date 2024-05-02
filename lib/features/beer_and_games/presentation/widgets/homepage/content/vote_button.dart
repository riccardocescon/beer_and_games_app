part of 'homepage_content.dart';

class _VoteButton extends StatefulWidget {
  const _VoteButton({
    required this.presenceState,
  });

  final PresenceState presenceState;

  @override
  State<_VoteButton> createState() => __VoteButtonState();
}

class __VoteButtonState extends State<_VoteButton>
    with SingleTickerProviderStateMixin {
  User get me => sl<UserBloc>().user!;

  Color get _buttonColor {
    switch (widget.presenceState) {
      case PresenceState.present:
        return context.colorScheme.primary;
      case PresenceState.absent:
        return context.colorScheme.tertiary;
      case PresenceState.waiting:
        return context.colorScheme.secondaryContainer;
    }
  }

  String get _text {
    switch (widget.presenceState) {
      case PresenceState.present:
        return 'Ci sono';
      case PresenceState.absent:
        return 'Non ci sono';
      case PresenceState.waiting:
        return 'Non hai votato';
    }
  }

  Color get _textColor {
    switch (widget.presenceState) {
      case PresenceState.present:
        return context.colorScheme.onPrimary;
      case PresenceState.absent:
        return context.colorScheme.onTertiary;
      case PresenceState.waiting:
        return context.colorScheme.onSecondaryContainer;
    }
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );

  late final Animation<Color?> _colorTween = ColorTween(
    begin: MaterialTheme.darkScheme().surfaceContainerLow,
    end: _buttonColor,
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: BlocBuilder<HomepageBloc, HomepageState>(
        buildWhen: (previous, current) => current.maybeMap(
          loaded: (value) => true,
          orElse: () => false,
        ),
        builder: (context, state) {
          return state.maybeMap(
            loaded: (value) {
              return BlocListener<HomepageVoteAreaBloc, HomepageVoteAreaState>(
                listenWhen: (previous, current) => current.maybeMap(
                  presenceSet: (value) => true,
                  orElse: () => false,
                ),
                listener: (context, state) => _handleListener(state),
                child: AnimatedBuilder(
                  animation: _colorTween,
                  builder: (context, child) => _button(child),
                  child: _presenceText(),
                ),
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _button(Widget? child) {
    return FilledButton(
      onPressed: () {
        context.read<HomepageVoteAreaBloc>().add(
              HomepageVoteAreaEvent.setPresence(
                presence: widget.presenceState,
              ),
            );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          _colorTween.value,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      child: child,
    );
  }

  Widget _presenceText() {
    return Center(
      child: BlocBuilder<HomepageVoteAreaBloc, HomepageVoteAreaState>(
        builder: (context, state) {
          return state.maybeMap(
            presenceSet: (value) {
              final textColor = value.newPresence == widget.presenceState
                  ? _textColor
                  : MaterialTheme.darkScheme().onSurfaceVariant;
              return Text(
                _text,
                style: context.textTheme.bodyLarge!.copyWith(color: textColor),
                textAlign: TextAlign.center,
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  void _handleListener(HomepageVoteAreaState state) {
    state.maybeMap(
      presenceSet: (value) {
        if (value.newPresence == widget.presenceState) {
          _controller.forward();
        } else if (value.oldPresence == widget.presenceState) {
          _controller.reverse();
        }
      },
      orElse: () {},
    );
  }
}
