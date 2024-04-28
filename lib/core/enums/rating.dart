enum Rating {
  hate._(0),
  dislike._(1),
  neutral._(2),
  like._(3),
  love._(4),
  ;

  const Rating._(this.value);
  final int value;
}
