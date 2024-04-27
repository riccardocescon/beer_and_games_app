part of 'top_area.dart';

class _NextTime extends StatelessWidget {
  const _NextTime();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tempo rimanente per la votazione',
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.onBackground.withOpacity(0.5),
          ),
        ),
        BlocBuilder<HomepageBloc, HomepageState>(
          buildWhen: (previous, current) => current.maybeMap(
            dateTimeUpdate: (currDateTime) {
              final prevDateTime = previous.maybeMap(
                dateTimeUpdate: (value) => value.timeLeft,
                orElse: () => null,
              );
              if (prevDateTime == null) return true;

              return prevDateTime != currDateTime.timeLeft;
            },
            orElse: () => false,
          ),
          builder: (context, state) {
            return state.maybeMap(
              dateTimeUpdate: (value) {
                return Text(
                  value.timeLeft,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                );
              },
              orElse: () => Container(),
            );
          },
        ),
      ],
    );
  }
}
