part of 'top_area.dart';

class _NextDateTimeArea extends StatefulWidget {
  const _NextDateTimeArea();

  @override
  State<_NextDateTimeArea> createState() => _NextDateTimeAreaState();
}

class _NextDateTimeAreaState extends State<_NextDateTimeArea> {
  Offset? _tapPosition;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _storePosition,
      child: FilledButton(
        onPressed: () {},
        onLongPress: _handleLongPress,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
          backgroundColor: MaterialStateProperty.all(
            Colors.transparent,
          ),
          overlayColor: MaterialStateProperty.all(
            context.colorScheme.secondary.withOpacity(0.1),
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _NextDate(),
            _NextTime(),
          ],
        ),
      ),
    );
  }

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }

  void _handleLongPress() {
    final overlay =
        Overlay.of(context).context.findRenderObject()! as RenderBox;

    final hangout = sl<HangoutBloc>().hangout;
    if (hangout == null) {
      context.warningSnackbar(
        'Desincronizzato',
        'Non hai ancora scaricato tutti i dati...',
      );
      return;
    }

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
          height: 10,
          onTap: () {
            context.push(
              BlocProvider(
                create: (context) {
                  return sl<EditHangoutPageBloc>()
                    ..add(EditHangoutPageEvent.setup(hangout: hangout));
                },
                child: const EditHangoutDateTimePage(),
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
      ],
    );
  }
}
