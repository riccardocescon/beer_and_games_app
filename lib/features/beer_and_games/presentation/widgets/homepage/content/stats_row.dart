part of 'homepage_content.dart';

class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.hangout});

  final Hangout hangout;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _button(
            context,
            () {
              context.read<HomepageBloc>().add(const HomepageEvent.showGames());
            },
            'Disponibilità',
          ),
        ),
        width10,
        Expanded(
          child: _button(
            context,
            () {
              context.push(
                MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => sl<HangoutStatsPageBloc>()
                        ..add(HangoutStatsPageEvent.setup(hangout: hangout)),
                    ),
                    BlocProvider(
                      create: (_) =>
                          sl<ItemsBloc>()..add(const ItemsEvent.download()),
                    ),
                  ],
                  child: const HangoutStatsPage(),
                ),
              );
            },
            'Statistiche',
          ),
        ),
      ],
    );
  }

  Widget _button(
    BuildContext context,
    VoidCallback onPressed,
    String text,
  ) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(context.colorScheme.secondaryContainer),
      ),
      child: Text(
        text,
        style: context.textTheme.bodyMedium?.copyWith(
          color: context.colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}
