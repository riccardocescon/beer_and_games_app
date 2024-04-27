part of 'top_area.dart';

class _OfflineButton extends StatefulWidget {
  const _OfflineButton();

  @override
  State<_OfflineButton> createState() => _OfflineButtonState();
}

class _OfflineButtonState extends State<_OfflineButton>
    with SingleTickerProviderStateMixin {
  final _animationDuration = const Duration(milliseconds: 800);

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: _animationDuration);

  late Animation<double> _animation;
  final _buttonLength = 120.0;
  final _buttonHeigth = 24.0;

  @override
  void initState() {
    _animation = Tween<double>(
      begin: _buttonHeigth,
      end: _buttonLength,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );

    _controller.forward();
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
          width: _animation.value,
          height: _buttonHeigth,
          child: FilledButton(
            onPressed: () {
              context.warningSnackbar('Work in progress', 'Coming soon!');
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(context.colorScheme.tertiary),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.cloud_off_rounded,
                  color: context.colorScheme.onTertiary,
                  size: context.textTheme.bodyLarge?.fontSize,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      width10,
                      AnimatedOpacity(
                        duration: _animationDuration,
                        curve: Curves.easeInOutCubic,
                        opacity: _animation.value >= _buttonLength ? 1 : 0,
                        child: Text(
                          'Offline',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colorScheme.onTertiary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
