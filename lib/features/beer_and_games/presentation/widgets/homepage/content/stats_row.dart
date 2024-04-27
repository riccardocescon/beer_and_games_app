part of 'homepage_content.dart';

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _button(
            context,
            () {},
            'Disponibilità',
          ),
        ),
        width10,
        Expanded(
          child: _button(
            context,
            () {},
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
