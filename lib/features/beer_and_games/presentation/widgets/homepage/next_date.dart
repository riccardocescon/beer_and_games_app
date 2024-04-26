part of 'top_area.dart';

class _NextDate extends StatelessWidget {
  const _NextDate();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Prossima sessione',
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.onBackground.withOpacity(0.5),
          ),
        ),
        BlocBuilder<HomepageBloc, HomepageState>(
          buildWhen: (previous, current) => current.maybeMap(
            dateTimeUpdate: (currDateTime) {
              final prevDateTime = previous.maybeMap(
                dateTimeUpdate: (value) => value.date,
                orElse: () => null,
              );
              if (prevDateTime == null) return true;

              return prevDateTime != currDateTime.date;
            },
            orElse: () => false,
          ),
          builder: (context, state) {
            return state.maybeMap(
              dateTimeUpdate: (value) {
                return Text(
                  value.date,
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
