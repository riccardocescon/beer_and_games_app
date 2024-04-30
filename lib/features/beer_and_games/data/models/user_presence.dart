class UserPresenceModel {
  final String email;
  final int presenceCount;

  UserPresenceModel._({required this.email, required this.presenceCount});

  factory UserPresenceModel.fromData(String data) {
    final parts = data.split('|');
    return UserPresenceModel._(
      email: parts.first,
      presenceCount: int.parse(parts.last),
    );
  }
}
