// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hangout_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HangoutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() select,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? select,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? select,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Select value) select,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Select value)? select,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Select value)? select,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HangoutEventCopyWith<$Res> {
  factory $HangoutEventCopyWith(
          HangoutEvent value, $Res Function(HangoutEvent) then) =
      _$HangoutEventCopyWithImpl<$Res, HangoutEvent>;
}

/// @nodoc
class _$HangoutEventCopyWithImpl<$Res, $Val extends HangoutEvent>
    implements $HangoutEventCopyWith<$Res> {
  _$HangoutEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SelectImplCopyWith<$Res> {
  factory _$$SelectImplCopyWith(
          _$SelectImpl value, $Res Function(_$SelectImpl) then) =
      __$$SelectImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SelectImplCopyWithImpl<$Res>
    extends _$HangoutEventCopyWithImpl<$Res, _$SelectImpl>
    implements _$$SelectImplCopyWith<$Res> {
  __$$SelectImplCopyWithImpl(
      _$SelectImpl _value, $Res Function(_$SelectImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SelectImpl extends Select {
  const _$SelectImpl() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() select,
  }) {
    return select();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? select,
  }) {
    return select?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? select,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Select value) select,
  }) {
    return select(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Select value)? select,
  }) {
    return select?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Select value)? select,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(this);
    }
    return orElse();
  }
}

abstract class Select extends HangoutEvent {
  const factory Select() = _$SelectImpl;
  const Select._() : super._();
}

/// @nodoc
mixin _$HangoutState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(Hangout hangout) loaded,
    required TResult Function(int missingDays, int missingHours,
            int missingMinutes, DateTime date)
        dateTimeUpdate,
    required TResult Function(CloudFailure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Hangout hangout)? loaded,
    TResult? Function(int missingDays, int missingHours, int missingMinutes,
            DateTime date)?
        dateTimeUpdate,
    TResult? Function(CloudFailure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Hangout hangout)? loaded,
    TResult Function(int missingDays, int missingHours, int missingMinutes,
            DateTime date)?
        dateTimeUpdate,
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
abstract class $HangoutStateCopyWith<$Res> {
  factory $HangoutStateCopyWith(
          HangoutState value, $Res Function(HangoutState) then) =
      _$HangoutStateCopyWithImpl<$Res, HangoutState>;
}

/// @nodoc
class _$HangoutStateCopyWithImpl<$Res, $Val extends HangoutState>
    implements $HangoutStateCopyWith<$Res> {
  _$HangoutStateCopyWithImpl(this._value, this._then);

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
    extends _$HangoutStateCopyWithImpl<$Res, _$InitImpl>
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
    required TResult Function(int missingDays, int missingHours,
            int missingMinutes, DateTime date)
        dateTimeUpdate,
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
    TResult? Function(int missingDays, int missingHours, int missingMinutes,
            DateTime date)?
        dateTimeUpdate,
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
    TResult Function(int missingDays, int missingHours, int missingMinutes,
            DateTime date)?
        dateTimeUpdate,
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

abstract class Init extends HangoutState {
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
    extends _$HangoutStateCopyWithImpl<$Res, _$LoadingImpl>
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
    required TResult Function(int missingDays, int missingHours,
            int missingMinutes, DateTime date)
        dateTimeUpdate,
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
    TResult? Function(int missingDays, int missingHours, int missingMinutes,
            DateTime date)?
        dateTimeUpdate,
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
    TResult Function(int missingDays, int missingHours, int missingMinutes,
            DateTime date)?
        dateTimeUpdate,
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

abstract class Loading extends HangoutState {
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
    extends _$HangoutStateCopyWithImpl<$Res, _$LoadedImpl>
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
    required TResult Function(int missingDays, int missingHours,
            int missingMinutes, DateTime date)
        dateTimeUpdate,
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
    TResult? Function(int missingDays, int missingHours, int missingMinutes,
            DateTime date)?
        dateTimeUpdate,
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
    TResult Function(int missingDays, int missingHours, int missingMinutes,
            DateTime date)?
        dateTimeUpdate,
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

abstract class Loaded extends HangoutState {
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
  $Res call(
      {int missingDays, int missingHours, int missingMinutes, DateTime date});
}

/// @nodoc
class __$$DateTimeUpdateImplCopyWithImpl<$Res>
    extends _$HangoutStateCopyWithImpl<$Res, _$DateTimeUpdateImpl>
    implements _$$DateTimeUpdateImplCopyWith<$Res> {
  __$$DateTimeUpdateImplCopyWithImpl(
      _$DateTimeUpdateImpl _value, $Res Function(_$DateTimeUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missingDays = null,
    Object? missingHours = null,
    Object? missingMinutes = null,
    Object? date = null,
  }) {
    return _then(_$DateTimeUpdateImpl(
      missingDays: null == missingDays
          ? _value.missingDays
          : missingDays // ignore: cast_nullable_to_non_nullable
              as int,
      missingHours: null == missingHours
          ? _value.missingHours
          : missingHours // ignore: cast_nullable_to_non_nullable
              as int,
      missingMinutes: null == missingMinutes
          ? _value.missingMinutes
          : missingMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DateTimeUpdateImpl extends DateTimeUpdate {
  const _$DateTimeUpdateImpl(
      {required this.missingDays,
      required this.missingHours,
      required this.missingMinutes,
      required this.date})
      : super._();

  @override
  final int missingDays;
  @override
  final int missingHours;
  @override
  final int missingMinutes;
  @override
  final DateTime date;

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
    required TResult Function(int missingDays, int missingHours,
            int missingMinutes, DateTime date)
        dateTimeUpdate,
    required TResult Function(CloudFailure failure) error,
  }) {
    return dateTimeUpdate(missingDays, missingHours, missingMinutes, date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Hangout hangout)? loaded,
    TResult? Function(int missingDays, int missingHours, int missingMinutes,
            DateTime date)?
        dateTimeUpdate,
    TResult? Function(CloudFailure failure)? error,
  }) {
    return dateTimeUpdate?.call(
        missingDays, missingHours, missingMinutes, date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Hangout hangout)? loaded,
    TResult Function(int missingDays, int missingHours, int missingMinutes,
            DateTime date)?
        dateTimeUpdate,
    TResult Function(CloudFailure failure)? error,
    required TResult orElse(),
  }) {
    if (dateTimeUpdate != null) {
      return dateTimeUpdate(missingDays, missingHours, missingMinutes, date);
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

abstract class DateTimeUpdate extends HangoutState {
  const factory DateTimeUpdate(
      {required final int missingDays,
      required final int missingHours,
      required final int missingMinutes,
      required final DateTime date}) = _$DateTimeUpdateImpl;
  const DateTimeUpdate._() : super._();

  int get missingDays;
  int get missingHours;
  int get missingMinutes;
  DateTime get date;
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
    extends _$HangoutStateCopyWithImpl<$Res, _$ErrorImpl>
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
    required TResult Function(int missingDays, int missingHours,
            int missingMinutes, DateTime date)
        dateTimeUpdate,
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
    TResult? Function(int missingDays, int missingHours, int missingMinutes,
            DateTime date)?
        dateTimeUpdate,
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
    TResult Function(int missingDays, int missingHours, int missingMinutes,
            DateTime date)?
        dateTimeUpdate,
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

abstract class Error extends HangoutState {
  const factory Error(final CloudFailure failure) = _$ErrorImpl;
  const Error._() : super._();

  CloudFailure get failure;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
