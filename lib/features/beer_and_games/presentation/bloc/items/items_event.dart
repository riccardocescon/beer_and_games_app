part of 'items_bloc.dart';

@freezed
sealed class ItemsEvent extends AppEvent with _$ItemsEvent, EquatableMixin {
  const ItemsEvent._();

  const factory ItemsEvent.download() = Download;

  @override
  List<Object?> get props => map(
        download: (value) => [],
      );
}
