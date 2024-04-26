// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'homepage_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomepageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() setup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? setup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? setup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Setup value) setup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Setup value)? setup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Setup value)? setup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomepageEventCopyWith<$Res> {
  factory $HomepageEventCopyWith(
          HomepageEvent value, $Res Function(HomepageEvent) then) =
      _$HomepageEventCopyWithImpl<$Res, HomepageEvent>;
}

/// @nodoc
class _$HomepageEventCopyWithImpl<$Res, $Val extends HomepageEvent>
    implements $HomepageEventCopyWith<$Res> {
  _$HomepageEventCopyWithImpl(this._value, this._then);

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
}

/// @nodoc
class __$$SetupImplCopyWithImpl<$Res>
    extends _$HomepageEventCopyWithImpl<$Res, _$SetupImpl>
    implements _$$SetupImplCopyWith<$Res> {
  __$$SetupImplCopyWithImpl(
      _$SetupImpl _value, $Res Function(_$SetupImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SetupImpl extends Setup {
  const _$SetupImpl() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() setup,
  }) {
    return setup();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? setup,
  }) {
    return setup?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? setup,
    required TResult orElse(),
  }) {
    if (setup != null) {
      return setup();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Setup value) setup,
  }) {
    return setup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Setup value)? setup,
  }) {
    return setup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Setup value)? setup,
    required TResult orElse(),
  }) {
    if (setup != null) {
      return setup(this);
    }
    return orElse();
  }
}

abstract class Setup extends HomepageEvent {
  const factory Setup() = _$SetupImpl;
  const Setup._() : super._();
}

/// @nodoc
mixin _$HomepageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(Hangout hangout) loaded,
    required TResult Function(String date, String timeLeft) dateTimeUpdate,
    required TResult Function(CloudFailure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Hangout hangout)? loaded,
    TResult? Function(String date, String timeLeft)? dateTimeUpdate,
    TResult? Function(CloudFailure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Hangout hangout)? loaded,
    TResult Function(String date, String timeLeft)? dateTimeUpdate,
    TResult Function(CloudFailure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(DateTimeUpdate value) dateTimeUpdate,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(DateTimeUpdate value)? dateTimeUpdate,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(DateTimeUpdate value)? dateTimeUpdate,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomepageStateCopyWith<$Res> {
  factory $HomepageStateCopyWith(
          HomepageState value, $Res Function(HomepageState) then) =
      _$HomepageStateCopyWithImpl<$Res, HomepageState>;
}

/// @nodoc
class _$HomepageStateCopyWithImpl<$Res, $Val extends HomepageState>
    implements $HomepageStateCopyWith<$Res> {
  _$HomepageStateCopyWithImpl(this._value, this._then);

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
    extends _$HomepageStateCopyWithImpl<$Res, _$InitImpl>
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
    required TResult Function(Hangout hangout) loaded,
    required TResult Function(String date, String timeLeft) dateTimeUpdate,
    required TResult Function(CloudFailure failure) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Hangout hangout)? loaded,
    TResult? Function(String date, String timeLeft)? dateTimeUpdate,
    TResult? Function(CloudFailure failure)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Hangout hangout)? loaded,
    TResult Function(String date, String timeLeft)? dateTimeUpdate,
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
    required TResult Function(Loaded value) loaded,
    required TResult Function(DateTimeUpdate value) dateTimeUpdate,
    required TResult Function(Error value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(DateTimeUpdate value)? dateTimeUpdate,
    TResult? Function(Error value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(DateTimeUpdate value)? dateTimeUpdate,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init extends HomepageState {
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
    extends _$HomepageStateCopyWithImpl<$Res, _$LoadingImpl>
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
    required TResult Function(Hangout hangout) loaded,
    required TResult Function(String date, String timeLeft) dateTimeUpdate,
    required TResult Function(CloudFailure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Hangout hangout)? loaded,
    TResult? Function(String date, String timeLeft)? dateTimeUpdate,
    TResult? Function(CloudFailure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Hangout hangout)? loaded,
    TResult Function(String date, String timeLeft)? dateTimeUpdate,
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
    required TResult Function(Loaded value) loaded,
    required TResult Function(DateTimeUpdate value) dateTimeUpdate,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(DateTimeUpdate value)? dateTimeUpdate,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(DateTimeUpdate value)? dateTimeUpdate,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading extends HomepageState {
  const factory Loading() = _$LoadingImpl;
  const Loading._() : super._();
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Hangout hangout});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$HomepageStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hangout = null,
  }) {
    return _then(_$LoadedImpl(
      null == hangout
          ? _value.hangout
          : hangout // ignore: cast_nullable_to_non_nullable
              as Hangout,
    ));
  }
}

/// @nodoc

class _$LoadedImpl extends Loaded {
  const _$LoadedImpl(this.hangout) : super._();

  @override
  final Hangout hangout;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(Hangout hangout) loaded,
    required TResult Function(String date, String timeLeft) dateTimeUpdate,
    required TResult Function(CloudFailure failure) error,
  }) {
    return loaded(hangout);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Hangout hangout)? loaded,
    TResult? Function(String date, String timeLeft)? dateTimeUpdate,
    TResult? Function(CloudFailure failure)? error,
  }) {
    return loaded?.call(hangout);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Hangout hangout)? loaded,
    TResult Function(String date, String timeLeft)? dateTimeUpdate,
    TResult Function(CloudFailure failure)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(hangout);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(DateTimeUpdate value) dateTimeUpdate,
    required TResult Function(Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(DateTimeUpdate value)? dateTimeUpdate,
    TResult? Function(Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(DateTimeUpdate value)? dateTimeUpdate,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded extends HomepageState {
  const factory Loaded(final Hangout hangout) = _$LoadedImpl;
  const Loaded._() : super._();

  Hangout get hangout;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DateTimeUpdateImplCopyWith<$Res> {
  factory _$$DateTimeUpdateImplCopyWith(_$DateTimeUpdateImpl value,
          $Res Function(_$DateTimeUpdateImpl) then) =
      __$$DateTimeUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String date, String timeLeft});
}

/// @nodoc
class __$$DateTimeUpdateImplCopyWithImpl<$Res>
    extends _$HomepageStateCopyWithImpl<$Res, _$DateTimeUpdateImpl>
    implements _$$DateTimeUpdateImplCopyWith<$Res> {
  __$$DateTimeUpdateImplCopyWithImpl(
      _$DateTimeUpdateImpl _value, $Res Function(_$DateTimeUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? timeLeft = null,
  }) {
    return _then(_$DateTimeUpdateImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      timeLeft: null == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DateTimeUpdateImpl extends DateTimeUpdate {
  const _$DateTimeUpdateImpl({required this.date, required this.timeLeft})
      : super._();

  @override
  final String date;
  @override
  final String timeLeft;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DateTimeUpdateImplCopyWith<_$DateTimeUpdateImpl> get copyWith =>
      __$$DateTimeUpdateImplCopyWithImpl<_$DateTimeUpdateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(Hangout hangout) loaded,
    required TResult Function(String date, String timeLeft) dateTimeUpdate,
    required TResult Function(CloudFailure failure) error,
  }) {
    return dateTimeUpdate(date, timeLeft);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Hangout hangout)? loaded,
    TResult? Function(String date, String timeLeft)? dateTimeUpdate,
    TResult? Function(CloudFailure failure)? error,
  }) {
    return dateTimeUpdate?.call(date, timeLeft);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Hangout hangout)? loaded,
    TResult Function(String date, String timeLeft)? dateTimeUpdate,
    TResult Function(CloudFailure failure)? error,
    required TResult orElse(),
  }) {
    if (dateTimeUpdate != null) {
      return dateTimeUpdate(date, timeLeft);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(DateTimeUpdate value) dateTimeUpdate,
    required TResult Function(Error value) error,
  }) {
    return dateTimeUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(DateTimeUpdate value)? dateTimeUpdate,
    TResult? Function(Error value)? error,
  }) {
    return dateTimeUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(DateTimeUpdate value)? dateTimeUpdate,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (dateTimeUpdate != null) {
      return dateTimeUpdate(this);
    }
    return orElse();
  }
}

abstract class DateTimeUpdate extends HomepageState {
  const factory DateTimeUpdate(
      {required final String date,
      required final String timeLeft}) = _$DateTimeUpdateImpl;
  const DateTimeUpdate._() : super._();

  String get date;
  String get timeLeft;
  @JsonKey(ignore: true)
  _$$DateTimeUpdateImplCopyWith<_$DateTimeUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$HomepageStateCopyWithImpl<$Res, _$ErrorImpl>
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
    required TResult Function(Hangout hangout) loaded,
    required TResult Function(String date, String timeLeft) dateTimeUpdate,
    required TResult Function(CloudFailure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Hangout hangout)? loaded,
    TResult? Function(String date, String timeLeft)? dateTimeUpdate,
    TResult? Function(CloudFailure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Hangout hangout)? loaded,
    TResult Function(String date, String timeLeft)? dateTimeUpdate,
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
    required TResult Function(Loaded value) loaded,
    required TResult Function(DateTimeUpdate value) dateTimeUpdate,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(DateTimeUpdate value)? dateTimeUpdate,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(DateTimeUpdate value)? dateTimeUpdate,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error extends HomepageState {
  const factory Error(final CloudFailure failure) = _$ErrorImpl;
  const Error._() : super._();

  CloudFailure get failure;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
