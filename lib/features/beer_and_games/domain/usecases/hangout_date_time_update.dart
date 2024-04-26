part of 'hangout_usecases.dart';

class HangoutDateTimeUpdate extends UseCase<void, HangoutDateTimeUpdateParams> {
  final HangoutRepository repository;

  HangoutDateTimeUpdate({required this.repository});

  @override
  Future<Either<CloudFailure, void>> call(
      HangoutDateTimeUpdateParams params) async {
    return await repository.updateDateTime(
      day: params.day,
      time: params.time,
    );
  }
}

class HangoutDateTimeUpdateParams {
  final Day day;
  final TimeOfDay time;

  HangoutDateTimeUpdateParams({
    required this.day,
    required this.time,
  });
}
