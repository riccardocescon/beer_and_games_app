part of 'edit_hangout_date_time_page_body.dart';

class _GeneralSection extends StatefulWidget {
  const _GeneralSection();

  @override
  State<_GeneralSection> createState() => __GeneralSectionState();
}

class __GeneralSectionState extends State<_GeneralSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Generali',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.w400,
              ),
        ),
        height10,
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                'Incontriamoci ogni',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
              ),
            ),
            Container(
              height: 30,
              decoration: BoxDecoration(
                color: context.colorScheme.primary,
                borderRadius: BorderRadius.circular(64),
              ),
              child: _dayDropdownButton(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                'sera alle',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
              ),
            ),
            SizedBox(
              height: 30,
              child: BlocBuilder<EditHangoutPageBloc, EditHangoutPageState>(
                buildWhen: (previous, current) => current.maybeMap(
                  updateUI: (currValue) {
                    final prevValue = previous.maybeMap(
                      updateUI: (prevValue) => prevValue.time,
                      orElse: () => null,
                    );
                    if (prevValue == null) return true;

                    return prevValue != currValue.time;
                  },
                  orElse: () => false,
                ),
                builder: (context, state) {
                  return state.maybeMap(
                    updateUI: (value) {
                      return FilledButton(
                        onPressed: () {
                          showTimePicker(
                            context: context,
                            initialTime: value.time,
                          ).then((value) {
                            if (value == null) return;

                            context.read<EditHangoutPageBloc>().add(
                                  EditHangoutPageEvent.setTime(time: value),
                                );
                          });
                        },
                        child: Text(
                          '${value.time.hour}:${value.time.minute.toString().padLeft(2, '0')}',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: context.colorScheme.onPrimary,
                                  ),
                        ),
                      );
                    },
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _dayDropdownButton() {
    return BlocBuilder<EditHangoutPageBloc, EditHangoutPageState>(
      buildWhen: (previous, current) => current.maybeMap(
        updateUI: (currValue) {
          final prevValue = previous.maybeMap(
            updateUI: (prevValue) => prevValue.day,
            orElse: () => null,
          );
          if (prevValue == null) return true;

          return prevValue != currValue.day;
        },
        orElse: () => false,
      ),
      builder: (context, state) {
        return state.maybeMap(
          updateUI: (value) {
            return DropdownButton<Day>(
              onChanged: (value) {
                if (value == null) return;

                context.read<EditHangoutPageBloc>().add(
                      EditHangoutPageEvent.setDayOfWeek(day: value),
                    );
              },
              underline: const SizedBox.shrink(),
              icon: const SizedBox.shrink(),
              value: Day.values.first,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              selectedItemBuilder: (context) {
                return [
                  Text(
                    value.day.name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: context.colorScheme.onPrimary,
                        ),
                  ),
                ];
              },
              borderRadius: BorderRadius.circular(24),
              alignment: Alignment.center,
              dropdownColor: context.colorScheme.primaryContainer,
              items: List.generate(
                Day.values.length,
                (index) {
                  final day = Day.values[index];
                  return DropdownMenuItem<Day>(
                    value: day,
                    child: Text(
                      day.name,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: context.colorScheme.onPrimaryContainer,
                          ),
                    ),
                  );
                },
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
