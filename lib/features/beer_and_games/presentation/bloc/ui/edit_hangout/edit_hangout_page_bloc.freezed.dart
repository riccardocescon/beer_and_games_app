// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_hangout_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditHangoutPageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Hangout hangout) setup,
    required TResult Function(Day day) setDayOfWeek,
    required TResult Function(TimeOfDay time) setTime,
    required TResult Function() save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Hangout hangout)? setup,
    TResult? Function(Day day)? setDayOfWeek,
    TResult? Function(TimeOfDay time)? setTime,
    TResult? Function()? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Hangout hangout)? setup,
    TResult Function(Day day)? setDayOfWeek,
    TResult Function(TimeOfDay time)? setTime,
    TResult Function()? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Setup value) setup,
    required TResult Function(SetDayOfWeek value) setDayOfWeek,
    required TResult Function(SetTime value) setTime,
    required TResult Function(Save value) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Setup value)? setup,
    TResult? Function(SetDayOfWeek value)? setDayOfWeek,
    TResult? Function(SetTime value)? setTime,
    TResult? Function(Save value)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Setup value)? setup,
    TResult Function(SetDayOfWeek value)? setDayOfWeek,
    TResult Function(SetTime value)? setTime,
    TResult Function(Save value)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditHangoutPageEventCopyWith<$Res> {
  factory $EditHangoutPageEventCopyWith(EditHangoutPageEvent value,
          $Res Function(EditHangoutPageEvent) then) =
      _$EditHangoutPageEventCopyWithImpl<$Res, EditHangoutPageEvent>;
}

/// @nodoc
class _$EditHangoutPageEventCopyWithImpl<$Res,
        $Val extends EditHangoutPageEvent>
    implements $EditHangoutPageEventCopyWith<$Res> {
  _$EditHangoutPageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SetupImplCopyWith<$Res> {
  factory _$$SetupImplCopyWith(
          _$SetupImpl value, $Res Function(_$SetupImpl) then) =
      __$$SetupImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Hangout hangout});
}

/// @nodoc
class __$$SetupImplCopyWithImpl<$Res>
    extends _$EditHangoutPageEventCopyWithImpl<$Res, _$SetupImpl>
    implements _$$SetupImplCopyWith<$Res> {
  __$$SetupImplCopyWithImpl(
      _$SetupImpl _value, $Res Function(_$SetupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hangout = null,
  }) {
    return _then(_$SetupImpl(
      hangout: null == hangout
          ? _value.hangout
          : hangout // ignore: cast_nullable_to_non_nullable
              as Hangout,
    ));
  }
}

/// @nodoc

class _$SetupImpl extends Setup {
  const _$SetupImpl({required this.hangout}) : super._();

  @override
  final Hangout hangout;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetupImplCopyWith<_$SetupImpl> get copyWith =>
      __$$SetupImplCopyWithImpl<_$SetupImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Hangout hangout) setup,
    required TResult Function(Day day) setDayOfWeek,
    required TResult Function(TimeOfDay time) setTime,
    required TResult Function() save,
  }) {
    return setup(hangout);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Hangout hangout)? setup,
    TResult? Function(Day day)? setDayOfWeek,
    TResult? Function(TimeOfDay time)? setTime,
    TResult? Function()? save,
  }) {
    return setup?.call(hangout);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Hangout hangout)? setup,
    TResult Function(Day day)? setDayOfWeek,
    TResult Function(TimeOfDay time)? setTime,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (setup != null) {
      return setup(hangout);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Setup value) setup,
    required TResult Function(SetDayOfWeek value) setDayOfWeek,
    required TResult Function(SetTime value) setTime,
    required TResult Function(Save value) save,
  }) {
    return setup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Setup value)? setup,
    TResult? Function(SetDayOfWeek value)? setDayOfWeek,
    TResult? Function(SetTime value)? setTime,
    TResult? Function(Save value)? save,
  }) {
    return setup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Setup value)? setup,
    TResult Function(SetDayOfWeek value)? setDayOfWeek,
    TResult Function(SetTime value)? setTime,
    TResult Function(Save value)? save,
    required TResult orElse(),
  }) {
    if (setup != null) {
      return setup(this);
    }
    return orElse();
  }
}

abstract class Setup extends EditHangoutPageEvent {
  const factory Setup({required final Hangout hangout}) = _$SetupImpl;
  const Setup._() : super._();

  Hangout get hangout;
  @JsonKey(ignore: true)
  _$$SetupImplCopyWith<_$SetupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetDayOfWeekImplCopyWith<$Res> {
  factory _$$SetDayOfWeekImplCopyWith(
          _$SetDayOfWeekImpl value, $Res Function(_$SetDayOfWeekImpl) then) =
      __$$SetDayOfWeekImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Day day});
}

/// @nodoc
class __$$SetDayOfWeekImplCopyWithImpl<$Res>
    extends _$EditHangoutPageEventCopyWithImpl<$Res, _$SetDayOfWeekImpl>
    implements _$$SetDayOfWeekImplCopyWith<$Res> {
  __$$SetDayOfWeekImplCopyWithImpl(
      _$SetDayOfWeekImpl _value, $Res Function(_$SetDayOfWeekImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
  }) {
    return _then(_$SetDayOfWeekImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as Day,
    ));
  }
}

/// @nodoc

class _$SetDayOfWeekImpl extends SetDayOfWeek {
  const _$SetDayOfWeekImpl({required this.day}) : super._();

  @override
  final Day day;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetDayOfWeekImplCopyWith<_$SetDayOfWeekImpl> get copyWith =>
      __$$SetDayOfWeekImplCopyWithImpl<_$SetDayOfWeekImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Hangout hangout) setup,
    required TResult Function(Day day) setDayOfWeek,
    required TResult Function(TimeOfDay time) setTime,
    required TResult Function() save,
  }) {
    return setDayOfWeek(day);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Hangout hangout)? setup,
    TResult? Function(Day day)? setDayOfWeek,
    TResult? Function(TimeOfDay time)? setTime,
    TResult? Function()? save,
  }) {
    return setDayOfWeek?.call(day);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Hangout hangout)? setup,
    TResult Function(Day day)? setDayOfWeek,
    TResult Function(TimeOfDay time)? setTime,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (setDayOfWeek != null) {
      return setDayOfWeek(day);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Setup value) setup,
    required TResult Function(SetDayOfWeek value) setDayOfWeek,
    required TResult Function(SetTime value) setTime,
    required TResult Function(Save value) save,
  }) {
    return setDayOfWeek(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Setup value)? setup,
    TResult? Function(SetDayOfWeek value)? setDayOfWeek,
    TResult? Function(SetTime value)? setTime,
    TResult? Function(Save value)? save,
  }) {
    return setDayOfWeek?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Setup value)? setup,
    TResult Function(SetDayOfWeek value)? setDayOfWeek,
    TResult Function(SetTime value)? setTime,
    TResult Function(Save value)? save,
    required TResult orElse(),
  }) {
    if (setDayOfWeek != null) {
      return setDayOfWeek(this);
    }
    return orElse();
  }
}

abstract class SetDayOfWeek extends EditHangoutPageEvent {
  const factory SetDayOfWeek({required final Day day}) = _$SetDayOfWeekImpl;
  const SetDayOfWeek._() : super._();

  Day get day;
  @JsonKey(ignore: true)
  _$$SetDayOfWeekImplCopyWith<_$SetDayOfWeekImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetTimeImplCopyWith<$Res> {
  factory _$$SetTimeImplCopyWith(
          _$SetTimeImpl value, $Res Function(_$SetTimeImpl) then) =
      __$$SetTimeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TimeOfDay time});
}

/// @nodoc
class __$$SetTimeImplCopyWithImpl<$Res>
    extends _$EditHangoutPageEventCopyWithImpl<$Res, _$SetTimeImpl>
    implements _$$SetTimeImplCopyWith<$Res> {
  __$$SetTimeImplCopyWithImpl(
      _$SetTimeImpl _value, $Res Function(_$SetTimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
  }) {
    return _then(_$SetTimeImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
    ));
  }
}

/// @nodoc

class _$SetTimeImpl extends SetTime {
  const _$SetTimeImpl({required this.time}) : super._();

  @override
  final TimeOfDay time;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetTimeImplCopyWith<_$SetTimeImpl> get copyWith =>
      __$$SetTimeImplCopyWithImpl<_$SetTimeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Hangout hangout) setup,
    required TResult Function(Day day) setDayOfWeek,
    required TResult Function(TimeOfDay time) setTime,
    required TResult Function() save,
  }) {
    return setTime(time);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Hangout hangout)? setup,
    TResult? Function(Day day)? setDayOfWeek,
    TResult? Function(TimeOfDay time)? setTime,
    TResult? Function()? save,
  }) {
    return setTime?.call(time);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Hangout hangout)? setup,
    TResult Function(Day day)? setDayOfWeek,
    TResult Function(TimeOfDay time)? setTime,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (setTime != null) {
      return setTime(time);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Setup value) setup,
    required TResult Function(SetDayOfWeek value) setDayOfWeek,
    required TResult Function(SetTime value) setTime,
    required TResult Function(Save value) save,
  }) {
    return setTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Setup value)? setup,
    TResult? Function(SetDayOfWeek value)? setDayOfWeek,
    TResult? Function(SetTime value)? setTime,
    TResult? Function(Save value)? save,
  }) {
    return setTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Setup value)? setup,
    TResult Function(SetDayOfWeek value)? setDayOfWeek,
    TResult Function(SetTime value)? setTime,
    TResult Function(Save value)? save,
    required TResult orElse(),
  }) {
    if (setTime != null) {
      return setTime(this);
    }
    return orElse();
  }
}

abstract class SetTime extends EditHangoutPageEvent {
  const factory SetTime({required final TimeOfDay time}) = _$SetTimeImpl;
  const SetTime._() : super._();

  TimeOfDay get time;
  @JsonKey(ignore: true)
  _$$SetTimeImplCopyWith<_$SetTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveImplCopyWith<$Res> {
  factory _$$SaveImplCopyWith(
          _$SaveImpl value, $Res Function(_$SaveImpl) then) =
      __$$SaveImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SaveImplCopyWithImpl<$Res>
    extends _$EditHangoutPageEventCopyWithImpl<$Res, _$SaveImpl>
    implements _$$SaveImplCopyWith<$Res> {
  __$$SaveImplCopyWithImpl(_$SaveImpl _value, $Res Function(_$SaveImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SaveImpl extends Save {
  const _$SaveImpl() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Hangout hangout) setup,
    required TResult Function(Day day) setDayOfWeek,
    required TResult Function(TimeOfDay time) setTime,
    required TResult Function() save,
  }) {
    return save();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Hangout hangout)? setup,
    TResult? Function(Day day)? setDayOfWeek,
    TResult? Function(TimeOfDay time)? setTime,
    TResult? Function()? save,
  }) {
    return save?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Hangout hangout)? setup,
    TResult Function(Day day)? setDayOfWeek,
    TResult Function(TimeOfDay time)? setTime,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Setup value) setup,
    required TResult Function(SetDayOfWeek value) setDayOfWeek,
    required TResult Function(SetTime value) setTime,
    required TResult Function(Save value) save,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Setup value)? setup,
    TResult? Function(SetDayOfWeek value)? setDayOfWeek,
    TResult? Function(SetTime value)? setTime,
    TResult? Function(Save value)? save,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Setup value)? setup,
    TResult Function(SetDayOfWeek value)? setDayOfWeek,
    TResult Function(SetTime value)? setTime,
    TResult Function(Save value)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class Save extends EditHangoutPageEvent {
  const factory Save() = _$SaveImpl;
  const Save._() : super._();
}

/// @nodoc
mixin _$EditHangoutPageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(Day day, TimeOfDay time) updateUI,
    required TResult Function() saved,
    required TResult Function(CloudFailure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Day day, TimeOfDay time)? updateUI,
    TResult? Function()? saved,
    TResult? Function(CloudFailure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Day day, TimeOfDay time)? updateUI,
    TResult Function()? saved,
    TResult Function(CloudFailure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(UpdateUI value) updateUI,
    required TResult Function(Saved value) saved,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(UpdateUI value)? updateUI,
    TResult? Function(Saved value)? saved,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(UpdateUI value)? updateUI,
    TResult Function(Saved value)? saved,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditHangoutPageStateCopyWith<$Res> {
  factory $EditHangoutPageStateCopyWith(EditHangoutPageState value,
          $Res Function(EditHangoutPageState) then) =
      _$EditHangoutPageStateCopyWithImpl<$Res, EditHangoutPageState>;
}

/// @nodoc
class _$EditHangoutPageStateCopyWithImpl<$Res,
        $Val extends EditHangoutPageState>
    implements $EditHangoutPageStateCopyWith<$Res> {
  _$EditHangoutPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$EditHangoutPageStateCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl extends Init {
  const _$InitImpl() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(Day day, TimeOfDay time) updateUI,
    required TResult Function() saved,
    required TResult Function(CloudFailure failure) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Day day, TimeOfDay time)? updateUI,
    TResult? Function()? saved,
    TResult? Function(CloudFailure failure)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Day day, TimeOfDay time)? updateUI,
    TResult Function()? saved,
    TResult Function(CloudFailure failure)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(UpdateUI value) updateUI,
    required TResult Function(Saved value) saved,
    required TResult Function(Error value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(UpdateUI value)? updateUI,
    TResult? Function(Saved value)? saved,
    TResult? Function(Error value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(UpdateUI value)? updateUI,
    TResult Function(Saved value)? saved,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init extends EditHangoutPageState {
  const factory Init() = _$InitImpl;
  const Init._() : super._();
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$EditHangoutPageStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl extends Loading {
  const _$LoadingImpl() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(Day day, TimeOfDay time) updateUI,
    required TResult Function() saved,
    required TResult Function(CloudFailure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Day day, TimeOfDay time)? updateUI,
    TResult? Function()? saved,
    TResult? Function(CloudFailure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Day day, TimeOfDay time)? updateUI,
    TResult Function()? saved,
    TResult Function(CloudFailure failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(UpdateUI value) updateUI,
    required TResult Function(Saved value) saved,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(UpdateUI value)? updateUI,
    TResult? Function(Saved value)? saved,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(UpdateUI value)? updateUI,
    TResult Function(Saved value)? saved,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading extends EditHangoutPageState {
  const factory Loading() = _$LoadingImpl;
  const Loading._() : super._();
}

/// @nodoc
abstract class _$$UpdateUIImplCopyWith<$Res> {
  factory _$$UpdateUIImplCopyWith(
          _$UpdateUIImpl value, $Res Function(_$UpdateUIImpl) then) =
      __$$UpdateUIImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Day day, TimeOfDay time});
}

/// @nodoc
class __$$UpdateUIImplCopyWithImpl<$Res>
    extends _$EditHangoutPageStateCopyWithImpl<$Res, _$UpdateUIImpl>
    implements _$$UpdateUIImplCopyWith<$Res> {
  __$$UpdateUIImplCopyWithImpl(
      _$UpdateUIImpl _value, $Res Function(_$UpdateUIImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? time = null,
  }) {
    return _then(_$UpdateUIImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as Day,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
    ));
  }
}

/// @nodoc

class _$UpdateUIImpl extends UpdateUI {
  const _$UpdateUIImpl({required this.day, required this.time}) : super._();

  @override
  final Day day;
  @override
  final TimeOfDay time;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUIImplCopyWith<_$UpdateUIImpl> get copyWith =>
      __$$UpdateUIImplCopyWithImpl<_$UpdateUIImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(Day day, TimeOfDay time) updateUI,
    required TResult Function() saved,
    required TResult Function(CloudFailure failure) error,
  }) {
    return updateUI(day, time);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Day day, TimeOfDay time)? updateUI,
    TResult? Function()? saved,
    TResult? Function(CloudFailure failure)? error,
  }) {
    return updateUI?.call(day, time);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Day day, TimeOfDay time)? updateUI,
    TResult Function()? saved,
    TResult Function(CloudFailure failure)? error,
    required TResult orElse(),
  }) {
    if (updateUI != null) {
      return updateUI(day, time);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(UpdateUI value) updateUI,
    required TResult Function(Saved value) saved,
    required TResult Function(Error value) error,
  }) {
    return updateUI(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(UpdateUI value)? updateUI,
    TResult? Function(Saved value)? saved,
    TResult? Function(Error value)? error,
  }) {
    return updateUI?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(UpdateUI value)? updateUI,
    TResult Function(Saved value)? saved,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (updateUI != null) {
      return updateUI(this);
    }
    return orElse();
  }
}

abstract class UpdateUI extends EditHangoutPageState {
  const factory UpdateUI(
      {required final Day day, required final TimeOfDay time}) = _$UpdateUIImpl;
  const UpdateUI._() : super._();

  Day get day;
  TimeOfDay get time;
  @JsonKey(ignore: true)
  _$$UpdateUIImplCopyWith<_$UpdateUIImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SavedImplCopyWith<$Res> {
  factory _$$SavedImplCopyWith(
          _$SavedImpl value, $Res Function(_$SavedImpl) then) =
      __$$SavedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SavedImplCopyWithImpl<$Res>
    extends _$EditHangoutPageStateCopyWithImpl<$Res, _$SavedImpl>
    implements _$$SavedImplCopyWith<$Res> {
  __$$SavedImplCopyWithImpl(
      _$SavedImpl _value, $Res Function(_$SavedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SavedImpl extends Saved {
  const _$SavedImpl() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(Day day, TimeOfDay time) updateUI,
    required TResult Function() saved,
    required TResult Function(CloudFailure failure) error,
  }) {
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Day day, TimeOfDay time)? updateUI,
    TResult? Function()? saved,
    TResult? Function(CloudFailure failure)? error,
  }) {
    return saved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Day day, TimeOfDay time)? updateUI,
    TResult Function()? saved,
    TResult Function(CloudFailure failure)? error,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(UpdateUI value) updateUI,
    required TResult Function(Saved value) saved,
    required TResult Function(Error value) error,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(UpdateUI value)? updateUI,
    TResult? Function(Saved value)? saved,
    TResult? Function(Error value)? error,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(UpdateUI value)? updateUI,
    TResult Function(Saved value)? saved,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class Saved extends EditHangoutPageState {
  const factory Saved() = _$SavedImpl;
  const Saved._() : super._();
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CloudFailure failure});

  $CloudFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$EditHangoutPageStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ErrorImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as CloudFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CloudFailureCopyWith<$Res> get failure {
    return $CloudFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$ErrorImpl extends Error {
  const _$ErrorImpl(this.failure) : super._();

  @override
  final CloudFailure failure;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(Day day, TimeOfDay time) updateUI,
    required TResult Function() saved,
    required TResult Function(CloudFailure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Day day, TimeOfDay time)? updateUI,
    TResult? Function()? saved,
    TResult? Function(CloudFailure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Day day, TimeOfDay time)? updateUI,
    TResult Function()? saved,
    TResult Function(CloudFailure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(UpdateUI value) updateUI,
    required TResult Function(Saved value) saved,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(UpdateUI value)? updateUI,
    TResult? Function(Saved value)? saved,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(UpdateUI value)? updateUI,
    TResult Function(Saved value)? saved,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error extends EditHangoutPageState {
  const factory Error(final CloudFailure failure) = _$ErrorImpl;
  const Error._() : super._();

  CloudFailure get failure;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
