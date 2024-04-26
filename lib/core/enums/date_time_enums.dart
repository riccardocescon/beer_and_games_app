enum Day {
  monday._(1, 'Lunedi'),
  tuesday._(2, 'Martedi'),
  wednesday._(3, 'Mercoledi'),
  thursday._(4, 'Giovedi'),
  friday._(5, 'Venerdi'),
  saturday._(6, 'Sabato'),
  sunday._(7, 'Domenica'),
  ;

  const Day._(this.value, this.name);
  final int value;
  final String name;
}
