part of 'homepage_bloc.dart';

@freezed
sealed class HomepageEvent extends AppEvent
    with _$HomepageEvent, EquatableMixin {
  const HomepageEvent._();

  const factory HomepageEvent.setup() = Setup;

  @override
  List<Object?> get props => map(
        setup: (value) => [],
      );
}
