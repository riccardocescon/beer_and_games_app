part of 'hangout_usecases.dart';

class HangoutUpdateVote extends UseCase<void, HangoutHangoutUpdateVoteParams> {
  final HangoutRepository repository;

  HangoutUpdateVote({required this.repository});

  @override
  Future<Either<CloudFailure, void>> call(
    HangoutHangoutUpdateVoteParams params,
  ) async {
    return await repository.updatePresence(
      presentEmailToRemove: params.presentEmailToRemove,
      presentEmailToAdd: params.presentEmailToAdd,
      absentEmailToRemove: params.absentEmailToRemove,
      absentEmailToAdd: params.absentEmailToAdd,
      waitingEmailToRemove: params.waitingEmailToRemove,
      waitingEmailToAdd: params.waitingEmailToAdd,
    );
  }
}

class HangoutHangoutUpdateVoteParams {
  final String? presentEmailToRemove;
  final String? presentEmailToAdd;
  final String? absentEmailToRemove;
  final String? absentEmailToAdd;
  final String? waitingEmailToRemove;
  final String? waitingEmailToAdd;

  HangoutHangoutUpdateVoteParams({
    required this.presentEmailToRemove,
    required this.presentEmailToAdd,
    required this.absentEmailToRemove,
    required this.absentEmailToAdd,
    required this.waitingEmailToRemove,
    required this.waitingEmailToAdd,
  });
}
