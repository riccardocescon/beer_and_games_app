part of 'hangout_usecases.dart';

class HangoutStream extends StreamUseCase<Hangout, void> {
  final HangoutRepository repository;

  HangoutStream({required this.repository});

  @override
  Stream<Either<CloudFailure, Hangout>> call(void params) async* {
    yield* repository.select();
  }
}
