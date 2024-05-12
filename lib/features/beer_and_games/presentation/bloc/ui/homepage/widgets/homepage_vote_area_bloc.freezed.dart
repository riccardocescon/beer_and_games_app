// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'homepage_vote_area_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomepageVoteAreaEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            HomepageBloc homepageBloc, Hangout hangout, User user)
        setup,
    required TResult Function(PresenceState presence) setPresence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomepageBloc homepageBloc, Hangout hangout, User user)?
        setup,
    TResult? Function(PresenceState presence)? setPresence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomepageBloc homepageBloc, Hangout hangout, User user)?
        setup,
    TResult Function(PresenceState presence)? setPresence,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Setup value) setup,
    required TResult Function(SetPresence value) setPresence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Setup value)? setup,
    TResult? Function(SetPresence value)? setPresence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Setup value)? setup,
    TResult Function(SetPresence value)? setPresence,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomepageVoteAreaEventCopyWith<$Res> {
  factory $HomepageVoteAreaEventCopyWith(HomepageVoteAreaEvent value,
          $Res Function(HomepageVoteAreaEvent) then) =
      _$HomepageVoteAreaEventCopyWithImpl<$Res, HomepageVoteAreaEvent>;
}

/// @nodoc
class _$HomepageVoteAreaEventCopyWithImpl<$Res,
        $Val extends HomepageVoteAreaEvent>
    implements $HomepageVoteAreaEventCopyWith<$Res> {
  _$HomepageVoteAreaEventCopyWithImpl(this._value, this._then);

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
  $Res call({HomepageBloc homepageBloc, Hangout hangout, User user});
}

/// @nodoc
class __$$SetupImplCopyWithImpl<$Res>
    extends _$HomepageVoteAreaEventCopyWithImpl<$Res, _$SetupImpl>
    implements _$$SetupImplCopyWith<$Res> {
  __$$SetupImplCopyWithImpl(
      _$SetupImpl _value, $Res Function(_$SetupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homepageBloc = freezed,
    Object? hangout = null,
    Object? user = null,
  }) {
    return _then(_$SetupImpl(
      homepageBloc: freezed == homepageBloc
          ? _value.homepageBloc
          : homepageBloc // ignore: cast_nullable_to_non_nullable
              as HomepageBloc,
      hangout: null == hangout
          ? _value.hangout
          : hangout // ignore: cast_nullable_to_non_nullable
              as Hangout,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$SetupImpl extends Setup {
  const _$SetupImpl(
      {required this.homepageBloc, required this.hangout, required this.user})
      : super._();

  @override
  final HomepageBloc homepageBloc;
  @override
  final Hangout hangout;
  @override
  final User user;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetupImplCopyWith<_$SetupImpl> get copyWith =>
      __$$SetupImplCopyWithImpl<_$SetupImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            HomepageBloc homepageBloc, Hangout hangout, User user)
        setup,
    required TResult Function(PresenceState presence) setPresence,
  }) {
    return setup(homepageBloc, hangout, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomepageBloc homepageBloc, Hangout hangout, User user)?
        setup,
    TResult? Function(PresenceState presence)? setPresence,
  }) {
    return setup?.call(homepageBloc, hangout, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomepageBloc homepageBloc, Hangout hangout, User user)?
        setup,
    TResult Function(PresenceState presence)? setPresence,
    required TResult orElse(),
  }) {
    if (setup != null) {
      return setup(homepageBloc, hangout, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Setup value) setup,
    required TResult Function(SetPresence value) setPresence,
  }) {
    return setup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Setup value)? setup,
    TResult? Function(SetPresence value)? setPresence,
  }) {
    return setup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Setup value)? setup,
    TResult Function(SetPresence value)? setPresence,
    required TResult orElse(),
  }) {
    if (setup != null) {
      return setup(this);
    }
    return orElse();
  }
}

abstract class Setup extends HomepageVoteAreaEvent {
  const factory Setup(
      {required final HomepageBloc homepageBloc,
      required final Hangout hangout,
      required final User user}) = _$SetupImpl;
  const Setup._() : super._();

  HomepageBloc get homepageBloc;
  Hangout get hangout;
  User get user;
  @JsonKey(ignore: true)
  _$$SetupImplCopyWith<_$SetupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetPresenceImplCopyWith<$Res> {
  factory _$$SetPresenceImplCopyWith(
          _$SetPresenceImpl value, $Res Function(_$SetPresenceImpl) then) =
      __$$SetPresenceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PresenceState presence});
}

/// @nodoc
class __$$SetPresenceImplCopyWithImpl<$Res>
    extends _$HomepageVoteAreaEventCopyWithImpl<$Res, _$SetPresenceImpl>
    implements _$$SetPresenceImplCopyWith<$Res> {
  __$$SetPresenceImplCopyWithImpl(
      _$SetPresenceImpl _value, $Res Function(_$SetPresenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? presence = null,
  }) {
    return _then(_$SetPresenceImpl(
      presence: null == presence
          ? _value.presence
          : presence // ignore: cast_nullable_to_non_nullable
              as PresenceState,
    ));
  }
}

/// @nodoc

class _$SetPresenceImpl extends SetPresence {
  const _$SetPresenceImpl({required this.presence}) : super._();

  @override
  final PresenceState presence;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetPresenceImplCopyWith<_$SetPresenceImpl> get copyWith =>
      __$$SetPresenceImplCopyWithImpl<_$SetPresenceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            HomepageBloc homepageBloc, Hangout hangout, User user)
        setup,
    required TResult Function(PresenceState presence) setPresence,
  }) {
    return setPresence(presence);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomepageBloc homepageBloc, Hangout hangout, User user)?
        setup,
    TResult? Function(PresenceState presence)? setPresence,
  }) {
    return setPresence?.call(presence);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomepageBloc homepageBloc, Hangout hangout, User user)?
        setup,
    TResult Function(PresenceState presence)? setPresence,
    required TResult orElse(),
  }) {
    if (setPresence != null) {
      return setPresence(presence);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Setup value) setup,
    required TResult Function(SetPresence value) setPresence,
  }) {
    return setPresence(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Setup value)? setup,
    TResult? Function(SetPresence value)? setPresence,
  }) {
    return setPresence?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Setup value)? setup,
    TResult Function(SetPresence value)? setPresence,
    required TResult orElse(),
  }) {
    if (setPresence != null) {
      return setPresence(this);
    }
    return orElse();
  }
}

abstract class SetPresence extends HomepageVoteAreaEvent {
  const factory SetPresence({required final PresenceState presence}) =
      _$SetPresenceImpl;
  const SetPresence._() : super._();

  PresenceState get presence;
  @JsonKey(ignore: true)
  _$$SetPresenceImplCopyWith<_$SetPresenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomepageVoteAreaState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(
            PresenceState? oldPresence, PresenceState newPresence)
        presenceSet,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(PresenceState? oldPresence, PresenceState newPresence)?
        presenceSet,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(PresenceState? oldPresence, PresenceState newPresence)?
        presenceSet,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(PresenceSet value) presenceSet,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(PresenceSet value)? presenceSet,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(PresenceSet value)? presenceSet,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomepageVoteAreaStateCopyWith<$Res> {
  factory $HomepageVoteAreaStateCopyWith(HomepageVoteAreaState value,
          $Res Function(HomepageVoteAreaState) then) =
      _$HomepageVoteAreaStateCopyWithImpl<$Res, HomepageVoteAreaState>;
}

/// @nodoc
class _$HomepageVoteAreaStateCopyWithImpl<$Res,
        $Val extends HomepageVoteAreaState>
    implements $HomepageVoteAreaStateCopyWith<$Res> {
  _$HomepageVoteAreaStateCopyWithImpl(this._value, this._then);

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
    extends _$HomepageVoteAreaStateCopyWithImpl<$Res, _$InitImpl>
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
    required TResult Function(
            PresenceState? oldPresence, PresenceState newPresence)
        presenceSet,
    required TResult Function(String message) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(PresenceState? oldPresence, PresenceState newPresence)?
        presenceSet,
    TResult? Function(String message)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(PresenceState? oldPresence, PresenceState newPresence)?
        presenceSet,
    TResult Function(String message)? error,
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
    required TResult Function(PresenceSet value) presenceSet,
    required TResult Function(Error value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(PresenceSet value)? presenceSet,
    TResult? Function(Error value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(PresenceSet value)? presenceSet,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init extends HomepageVoteAreaState {
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
    extends _$HomepageVoteAreaStateCopyWithImpl<$Res, _$LoadingImpl>
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
    required TResult Function(
            PresenceState? oldPresence, PresenceState newPresence)
        presenceSet,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(PresenceState? oldPresence, PresenceState newPresence)?
        presenceSet,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(PresenceState? oldPresence, PresenceState newPresence)?
        presenceSet,
    TResult Function(String message)? error,
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
    required TResult Function(PresenceSet value) presenceSet,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(PresenceSet value)? presenceSet,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(PresenceSet value)? presenceSet,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading extends HomepageVoteAreaState {
  const factory Loading() = _$LoadingImpl;
  const Loading._() : super._();
}

/// @nodoc
abstract class _$$PresenceSetImplCopyWith<$Res> {
  factory _$$PresenceSetImplCopyWith(
          _$PresenceSetImpl value, $Res Function(_$PresenceSetImpl) then) =
      __$$PresenceSetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PresenceState? oldPresence, PresenceState newPresence});
}

/// @nodoc
class __$$PresenceSetImplCopyWithImpl<$Res>
    extends _$HomepageVoteAreaStateCopyWithImpl<$Res, _$PresenceSetImpl>
    implements _$$PresenceSetImplCopyWith<$Res> {
  __$$PresenceSetImplCopyWithImpl(
      _$PresenceSetImpl _value, $Res Function(_$PresenceSetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldPresence = freezed,
    Object? newPresence = null,
  }) {
    return _then(_$PresenceSetImpl(
      oldPresence: freezed == oldPresence
          ? _value.oldPresence
          : oldPresence // ignore: cast_nullable_to_non_nullable
              as PresenceState?,
      newPresence: null == newPresence
          ? _value.newPresence
          : newPresence // ignore: cast_nullable_to_non_nullable
              as PresenceState,
    ));
  }
}

/// @nodoc

class _$PresenceSetImpl extends PresenceSet {
  const _$PresenceSetImpl(
      {required this.oldPresence, required this.newPresence})
      : super._();

  @override
  final PresenceState? oldPresence;
  @override
  final PresenceState newPresence;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PresenceSetImplCopyWith<_$PresenceSetImpl> get copyWith =>
      __$$PresenceSetImplCopyWithImpl<_$PresenceSetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(
            PresenceState? oldPresence, PresenceState newPresence)
        presenceSet,
    required TResult Function(String message) error,
  }) {
    return presenceSet(oldPresence, newPresence);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(PresenceState? oldPresence, PresenceState newPresence)?
        presenceSet,
    TResult? Function(String message)? error,
  }) {
    return presenceSet?.call(oldPresence, newPresence);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(PresenceState? oldPresence, PresenceState newPresence)?
        presenceSet,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (presenceSet != null) {
      return presenceSet(oldPresence, newPresence);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(PresenceSet value) presenceSet,
    required TResult Function(Error value) error,
  }) {
    return presenceSet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(PresenceSet value)? presenceSet,
    TResult? Function(Error value)? error,
  }) {
    return presenceSet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(PresenceSet value)? presenceSet,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (presenceSet != null) {
      return presenceSet(this);
    }
    return orElse();
  }
}

abstract class PresenceSet extends HomepageVoteAreaState {
  const factory PresenceSet(
      {required final PresenceState? oldPresence,
      required final PresenceState newPresence}) = _$PresenceSetImpl;
  const PresenceSet._() : super._();

  PresenceState? get oldPresence;
  PresenceState get newPresence;
  @JsonKey(ignore: true)
  _$$PresenceSetImplCopyWith<_$PresenceSetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$HomepageVoteAreaStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl extends Error {
  const _$ErrorImpl({required this.message}) : super._();

  @override
  final String message;

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
    required TResult Function(
            PresenceState? oldPresence, PresenceState newPresence)
        presenceSet,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(PresenceState? oldPresence, PresenceState newPresence)?
        presenceSet,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(PresenceState? oldPresence, PresenceState newPresence)?
        presenceSet,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(PresenceSet value) presenceSet,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(PresenceSet value)? presenceSet,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(PresenceSet value)? presenceSet,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error extends HomepageVoteAreaState {
  const factory Error({required final String message}) = _$ErrorImpl;
  const Error._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
