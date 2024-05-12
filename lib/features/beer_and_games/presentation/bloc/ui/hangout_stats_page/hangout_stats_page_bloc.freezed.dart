// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hangout_stats_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HangoutStatsPageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Hangout hangout) setup,
    required TResult Function() addBeer,
    required TResult Function() addWine,
    required TResult Function() addGame,
    required TResult Function(Item item) saveItem,
    required TResult Function() closeItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Hangout hangout)? setup,
    TResult? Function()? addBeer,
    TResult? Function()? addWine,
    TResult? Function()? addGame,
    TResult? Function(Item item)? saveItem,
    TResult? Function()? closeItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Hangout hangout)? setup,
    TResult Function()? addBeer,
    TResult Function()? addWine,
    TResult Function()? addGame,
    TResult Function(Item item)? saveItem,
    TResult Function()? closeItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Setup value) setup,
    required TResult Function(AddBeer value) addBeer,
    required TResult Function(AddWine value) addWine,
    required TResult Function(AddGame value) addGame,
    required TResult Function(SaveItem value) saveItem,
    required TResult Function(CloseItem value) closeItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Setup value)? setup,
    TResult? Function(AddBeer value)? addBeer,
    TResult? Function(AddWine value)? addWine,
    TResult? Function(AddGame value)? addGame,
    TResult? Function(SaveItem value)? saveItem,
    TResult? Function(CloseItem value)? closeItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Setup value)? setup,
    TResult Function(AddBeer value)? addBeer,
    TResult Function(AddWine value)? addWine,
    TResult Function(AddGame value)? addGame,
    TResult Function(SaveItem value)? saveItem,
    TResult Function(CloseItem value)? closeItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HangoutStatsPageEventCopyWith<$Res> {
  factory $HangoutStatsPageEventCopyWith(HangoutStatsPageEvent value,
          $Res Function(HangoutStatsPageEvent) then) =
      _$HangoutStatsPageEventCopyWithImpl<$Res, HangoutStatsPageEvent>;
}

/// @nodoc
class _$HangoutStatsPageEventCopyWithImpl<$Res,
        $Val extends HangoutStatsPageEvent>
    implements $HangoutStatsPageEventCopyWith<$Res> {
  _$HangoutStatsPageEventCopyWithImpl(this._value, this._then);

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
    extends _$HangoutStatsPageEventCopyWithImpl<$Res, _$SetupImpl>
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
    required TResult Function() addBeer,
    required TResult Function() addWine,
    required TResult Function() addGame,
    required TResult Function(Item item) saveItem,
    required TResult Function() closeItem,
  }) {
    return setup(hangout);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Hangout hangout)? setup,
    TResult? Function()? addBeer,
    TResult? Function()? addWine,
    TResult? Function()? addGame,
    TResult? Function(Item item)? saveItem,
    TResult? Function()? closeItem,
  }) {
    return setup?.call(hangout);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Hangout hangout)? setup,
    TResult Function()? addBeer,
    TResult Function()? addWine,
    TResult Function()? addGame,
    TResult Function(Item item)? saveItem,
    TResult Function()? closeItem,
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
    required TResult Function(AddBeer value) addBeer,
    required TResult Function(AddWine value) addWine,
    required TResult Function(AddGame value) addGame,
    required TResult Function(SaveItem value) saveItem,
    required TResult Function(CloseItem value) closeItem,
  }) {
    return setup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Setup value)? setup,
    TResult? Function(AddBeer value)? addBeer,
    TResult? Function(AddWine value)? addWine,
    TResult? Function(AddGame value)? addGame,
    TResult? Function(SaveItem value)? saveItem,
    TResult? Function(CloseItem value)? closeItem,
  }) {
    return setup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Setup value)? setup,
    TResult Function(AddBeer value)? addBeer,
    TResult Function(AddWine value)? addWine,
    TResult Function(AddGame value)? addGame,
    TResult Function(SaveItem value)? saveItem,
    TResult Function(CloseItem value)? closeItem,
    required TResult orElse(),
  }) {
    if (setup != null) {
      return setup(this);
    }
    return orElse();
  }
}

abstract class Setup extends HangoutStatsPageEvent {
  const factory Setup({required final Hangout hangout}) = _$SetupImpl;
  const Setup._() : super._();

  Hangout get hangout;
  @JsonKey(ignore: true)
  _$$SetupImplCopyWith<_$SetupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddBeerImplCopyWith<$Res> {
  factory _$$AddBeerImplCopyWith(
          _$AddBeerImpl value, $Res Function(_$AddBeerImpl) then) =
      __$$AddBeerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddBeerImplCopyWithImpl<$Res>
    extends _$HangoutStatsPageEventCopyWithImpl<$Res, _$AddBeerImpl>
    implements _$$AddBeerImplCopyWith<$Res> {
  __$$AddBeerImplCopyWithImpl(
      _$AddBeerImpl _value, $Res Function(_$AddBeerImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddBeerImpl extends AddBeer {
  const _$AddBeerImpl() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Hangout hangout) setup,
    required TResult Function() addBeer,
    required TResult Function() addWine,
    required TResult Function() addGame,
    required TResult Function(Item item) saveItem,
    required TResult Function() closeItem,
  }) {
    return addBeer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Hangout hangout)? setup,
    TResult? Function()? addBeer,
    TResult? Function()? addWine,
    TResult? Function()? addGame,
    TResult? Function(Item item)? saveItem,
    TResult? Function()? closeItem,
  }) {
    return addBeer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Hangout hangout)? setup,
    TResult Function()? addBeer,
    TResult Function()? addWine,
    TResult Function()? addGame,
    TResult Function(Item item)? saveItem,
    TResult Function()? closeItem,
    required TResult orElse(),
  }) {
    if (addBeer != null) {
      return addBeer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Setup value) setup,
    required TResult Function(AddBeer value) addBeer,
    required TResult Function(AddWine value) addWine,
    required TResult Function(AddGame value) addGame,
    required TResult Function(SaveItem value) saveItem,
    required TResult Function(CloseItem value) closeItem,
  }) {
    return addBeer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Setup value)? setup,
    TResult? Function(AddBeer value)? addBeer,
    TResult? Function(AddWine value)? addWine,
    TResult? Function(AddGame value)? addGame,
    TResult? Function(SaveItem value)? saveItem,
    TResult? Function(CloseItem value)? closeItem,
  }) {
    return addBeer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Setup value)? setup,
    TResult Function(AddBeer value)? addBeer,
    TResult Function(AddWine value)? addWine,
    TResult Function(AddGame value)? addGame,
    TResult Function(SaveItem value)? saveItem,
    TResult Function(CloseItem value)? closeItem,
    required TResult orElse(),
  }) {
    if (addBeer != null) {
      return addBeer(this);
    }
    return orElse();
  }
}

abstract class AddBeer extends HangoutStatsPageEvent {
  const factory AddBeer() = _$AddBeerImpl;
  const AddBeer._() : super._();
}

/// @nodoc
abstract class _$$AddWineImplCopyWith<$Res> {
  factory _$$AddWineImplCopyWith(
          _$AddWineImpl value, $Res Function(_$AddWineImpl) then) =
      __$$AddWineImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddWineImplCopyWithImpl<$Res>
    extends _$HangoutStatsPageEventCopyWithImpl<$Res, _$AddWineImpl>
    implements _$$AddWineImplCopyWith<$Res> {
  __$$AddWineImplCopyWithImpl(
      _$AddWineImpl _value, $Res Function(_$AddWineImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddWineImpl extends AddWine {
  const _$AddWineImpl() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Hangout hangout) setup,
    required TResult Function() addBeer,
    required TResult Function() addWine,
    required TResult Function() addGame,
    required TResult Function(Item item) saveItem,
    required TResult Function() closeItem,
  }) {
    return addWine();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Hangout hangout)? setup,
    TResult? Function()? addBeer,
    TResult? Function()? addWine,
    TResult? Function()? addGame,
    TResult? Function(Item item)? saveItem,
    TResult? Function()? closeItem,
  }) {
    return addWine?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Hangout hangout)? setup,
    TResult Function()? addBeer,
    TResult Function()? addWine,
    TResult Function()? addGame,
    TResult Function(Item item)? saveItem,
    TResult Function()? closeItem,
    required TResult orElse(),
  }) {
    if (addWine != null) {
      return addWine();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Setup value) setup,
    required TResult Function(AddBeer value) addBeer,
    required TResult Function(AddWine value) addWine,
    required TResult Function(AddGame value) addGame,
    required TResult Function(SaveItem value) saveItem,
    required TResult Function(CloseItem value) closeItem,
  }) {
    return addWine(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Setup value)? setup,
    TResult? Function(AddBeer value)? addBeer,
    TResult? Function(AddWine value)? addWine,
    TResult? Function(AddGame value)? addGame,
    TResult? Function(SaveItem value)? saveItem,
    TResult? Function(CloseItem value)? closeItem,
  }) {
    return addWine?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Setup value)? setup,
    TResult Function(AddBeer value)? addBeer,
    TResult Function(AddWine value)? addWine,
    TResult Function(AddGame value)? addGame,
    TResult Function(SaveItem value)? saveItem,
    TResult Function(CloseItem value)? closeItem,
    required TResult orElse(),
  }) {
    if (addWine != null) {
      return addWine(this);
    }
    return orElse();
  }
}

abstract class AddWine extends HangoutStatsPageEvent {
  const factory AddWine() = _$AddWineImpl;
  const AddWine._() : super._();
}

/// @nodoc
abstract class _$$AddGameImplCopyWith<$Res> {
  factory _$$AddGameImplCopyWith(
          _$AddGameImpl value, $Res Function(_$AddGameImpl) then) =
      __$$AddGameImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddGameImplCopyWithImpl<$Res>
    extends _$HangoutStatsPageEventCopyWithImpl<$Res, _$AddGameImpl>
    implements _$$AddGameImplCopyWith<$Res> {
  __$$AddGameImplCopyWithImpl(
      _$AddGameImpl _value, $Res Function(_$AddGameImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddGameImpl extends AddGame {
  const _$AddGameImpl() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Hangout hangout) setup,
    required TResult Function() addBeer,
    required TResult Function() addWine,
    required TResult Function() addGame,
    required TResult Function(Item item) saveItem,
    required TResult Function() closeItem,
  }) {
    return addGame();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Hangout hangout)? setup,
    TResult? Function()? addBeer,
    TResult? Function()? addWine,
    TResult? Function()? addGame,
    TResult? Function(Item item)? saveItem,
    TResult? Function()? closeItem,
  }) {
    return addGame?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Hangout hangout)? setup,
    TResult Function()? addBeer,
    TResult Function()? addWine,
    TResult Function()? addGame,
    TResult Function(Item item)? saveItem,
    TResult Function()? closeItem,
    required TResult orElse(),
  }) {
    if (addGame != null) {
      return addGame();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Setup value) setup,
    required TResult Function(AddBeer value) addBeer,
    required TResult Function(AddWine value) addWine,
    required TResult Function(AddGame value) addGame,
    required TResult Function(SaveItem value) saveItem,
    required TResult Function(CloseItem value) closeItem,
  }) {
    return addGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Setup value)? setup,
    TResult? Function(AddBeer value)? addBeer,
    TResult? Function(AddWine value)? addWine,
    TResult? Function(AddGame value)? addGame,
    TResult? Function(SaveItem value)? saveItem,
    TResult? Function(CloseItem value)? closeItem,
  }) {
    return addGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Setup value)? setup,
    TResult Function(AddBeer value)? addBeer,
    TResult Function(AddWine value)? addWine,
    TResult Function(AddGame value)? addGame,
    TResult Function(SaveItem value)? saveItem,
    TResult Function(CloseItem value)? closeItem,
    required TResult orElse(),
  }) {
    if (addGame != null) {
      return addGame(this);
    }
    return orElse();
  }
}

abstract class AddGame extends HangoutStatsPageEvent {
  const factory AddGame() = _$AddGameImpl;
  const AddGame._() : super._();
}

/// @nodoc
abstract class _$$SaveItemImplCopyWith<$Res> {
  factory _$$SaveItemImplCopyWith(
          _$SaveItemImpl value, $Res Function(_$SaveItemImpl) then) =
      __$$SaveItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Item item});
}

/// @nodoc
class __$$SaveItemImplCopyWithImpl<$Res>
    extends _$HangoutStatsPageEventCopyWithImpl<$Res, _$SaveItemImpl>
    implements _$$SaveItemImplCopyWith<$Res> {
  __$$SaveItemImplCopyWithImpl(
      _$SaveItemImpl _value, $Res Function(_$SaveItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$SaveItemImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
    ));
  }
}

/// @nodoc

class _$SaveItemImpl extends SaveItem {
  const _$SaveItemImpl({required this.item}) : super._();

  @override
  final Item item;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveItemImplCopyWith<_$SaveItemImpl> get copyWith =>
      __$$SaveItemImplCopyWithImpl<_$SaveItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Hangout hangout) setup,
    required TResult Function() addBeer,
    required TResult Function() addWine,
    required TResult Function() addGame,
    required TResult Function(Item item) saveItem,
    required TResult Function() closeItem,
  }) {
    return saveItem(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Hangout hangout)? setup,
    TResult? Function()? addBeer,
    TResult? Function()? addWine,
    TResult? Function()? addGame,
    TResult? Function(Item item)? saveItem,
    TResult? Function()? closeItem,
  }) {
    return saveItem?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Hangout hangout)? setup,
    TResult Function()? addBeer,
    TResult Function()? addWine,
    TResult Function()? addGame,
    TResult Function(Item item)? saveItem,
    TResult Function()? closeItem,
    required TResult orElse(),
  }) {
    if (saveItem != null) {
      return saveItem(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Setup value) setup,
    required TResult Function(AddBeer value) addBeer,
    required TResult Function(AddWine value) addWine,
    required TResult Function(AddGame value) addGame,
    required TResult Function(SaveItem value) saveItem,
    required TResult Function(CloseItem value) closeItem,
  }) {
    return saveItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Setup value)? setup,
    TResult? Function(AddBeer value)? addBeer,
    TResult? Function(AddWine value)? addWine,
    TResult? Function(AddGame value)? addGame,
    TResult? Function(SaveItem value)? saveItem,
    TResult? Function(CloseItem value)? closeItem,
  }) {
    return saveItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Setup value)? setup,
    TResult Function(AddBeer value)? addBeer,
    TResult Function(AddWine value)? addWine,
    TResult Function(AddGame value)? addGame,
    TResult Function(SaveItem value)? saveItem,
    TResult Function(CloseItem value)? closeItem,
    required TResult orElse(),
  }) {
    if (saveItem != null) {
      return saveItem(this);
    }
    return orElse();
  }
}

abstract class SaveItem extends HangoutStatsPageEvent {
  const factory SaveItem({required final Item item}) = _$SaveItemImpl;
  const SaveItem._() : super._();

  Item get item;
  @JsonKey(ignore: true)
  _$$SaveItemImplCopyWith<_$SaveItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CloseItemImplCopyWith<$Res> {
  factory _$$CloseItemImplCopyWith(
          _$CloseItemImpl value, $Res Function(_$CloseItemImpl) then) =
      __$$CloseItemImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CloseItemImplCopyWithImpl<$Res>
    extends _$HangoutStatsPageEventCopyWithImpl<$Res, _$CloseItemImpl>
    implements _$$CloseItemImplCopyWith<$Res> {
  __$$CloseItemImplCopyWithImpl(
      _$CloseItemImpl _value, $Res Function(_$CloseItemImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CloseItemImpl extends CloseItem {
  const _$CloseItemImpl() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Hangout hangout) setup,
    required TResult Function() addBeer,
    required TResult Function() addWine,
    required TResult Function() addGame,
    required TResult Function(Item item) saveItem,
    required TResult Function() closeItem,
  }) {
    return closeItem();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Hangout hangout)? setup,
    TResult? Function()? addBeer,
    TResult? Function()? addWine,
    TResult? Function()? addGame,
    TResult? Function(Item item)? saveItem,
    TResult? Function()? closeItem,
  }) {
    return closeItem?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Hangout hangout)? setup,
    TResult Function()? addBeer,
    TResult Function()? addWine,
    TResult Function()? addGame,
    TResult Function(Item item)? saveItem,
    TResult Function()? closeItem,
    required TResult orElse(),
  }) {
    if (closeItem != null) {
      return closeItem();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Setup value) setup,
    required TResult Function(AddBeer value) addBeer,
    required TResult Function(AddWine value) addWine,
    required TResult Function(AddGame value) addGame,
    required TResult Function(SaveItem value) saveItem,
    required TResult Function(CloseItem value) closeItem,
  }) {
    return closeItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Setup value)? setup,
    TResult? Function(AddBeer value)? addBeer,
    TResult? Function(AddWine value)? addWine,
    TResult? Function(AddGame value)? addGame,
    TResult? Function(SaveItem value)? saveItem,
    TResult? Function(CloseItem value)? closeItem,
  }) {
    return closeItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Setup value)? setup,
    TResult Function(AddBeer value)? addBeer,
    TResult Function(AddWine value)? addWine,
    TResult Function(AddGame value)? addGame,
    TResult Function(SaveItem value)? saveItem,
    TResult Function(CloseItem value)? closeItem,
    required TResult orElse(),
  }) {
    if (closeItem != null) {
      return closeItem(this);
    }
    return orElse();
  }
}

abstract class CloseItem extends HangoutStatsPageEvent {
  const factory CloseItem() = _$CloseItemImpl;
  const CloseItem._() : super._();
}

/// @nodoc
mixin _$HangoutStatsPageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(Hangout hangout) hangout,
    required TResult Function(bool addBeer, bool addWine, bool addGame)
        updateUI,
    required TResult Function(CloudFailure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Hangout hangout)? hangout,
    TResult? Function(bool addBeer, bool addWine, bool addGame)? updateUI,
    TResult? Function(CloudFailure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Hangout hangout)? hangout,
    TResult Function(bool addBeer, bool addWine, bool addGame)? updateUI,
    TResult Function(CloudFailure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) hangout,
    required TResult Function(UpdateUI value) updateUI,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? hangout,
    TResult? Function(UpdateUI value)? updateUI,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? hangout,
    TResult Function(UpdateUI value)? updateUI,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HangoutStatsPageStateCopyWith<$Res> {
  factory $HangoutStatsPageStateCopyWith(HangoutStatsPageState value,
          $Res Function(HangoutStatsPageState) then) =
      _$HangoutStatsPageStateCopyWithImpl<$Res, HangoutStatsPageState>;
}

/// @nodoc
class _$HangoutStatsPageStateCopyWithImpl<$Res,
        $Val extends HangoutStatsPageState>
    implements $HangoutStatsPageStateCopyWith<$Res> {
  _$HangoutStatsPageStateCopyWithImpl(this._value, this._then);

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
    extends _$HangoutStatsPageStateCopyWithImpl<$Res, _$InitImpl>
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
    required TResult Function(Hangout hangout) hangout,
    required TResult Function(bool addBeer, bool addWine, bool addGame)
        updateUI,
    required TResult Function(CloudFailure failure) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Hangout hangout)? hangout,
    TResult? Function(bool addBeer, bool addWine, bool addGame)? updateUI,
    TResult? Function(CloudFailure failure)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Hangout hangout)? hangout,
    TResult Function(bool addBeer, bool addWine, bool addGame)? updateUI,
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
    required TResult Function(Loaded value) hangout,
    required TResult Function(UpdateUI value) updateUI,
    required TResult Function(Error value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? hangout,
    TResult? Function(UpdateUI value)? updateUI,
    TResult? Function(Error value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? hangout,
    TResult Function(UpdateUI value)? updateUI,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init extends HangoutStatsPageState {
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
    extends _$HangoutStatsPageStateCopyWithImpl<$Res, _$LoadingImpl>
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
    required TResult Function(Hangout hangout) hangout,
    required TResult Function(bool addBeer, bool addWine, bool addGame)
        updateUI,
    required TResult Function(CloudFailure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Hangout hangout)? hangout,
    TResult? Function(bool addBeer, bool addWine, bool addGame)? updateUI,
    TResult? Function(CloudFailure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Hangout hangout)? hangout,
    TResult Function(bool addBeer, bool addWine, bool addGame)? updateUI,
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
    required TResult Function(Loaded value) hangout,
    required TResult Function(UpdateUI value) updateUI,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? hangout,
    TResult? Function(UpdateUI value)? updateUI,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? hangout,
    TResult Function(UpdateUI value)? updateUI,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading extends HangoutStatsPageState {
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
    extends _$HangoutStatsPageStateCopyWithImpl<$Res, _$LoadedImpl>
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
    required TResult Function(Hangout hangout) hangout,
    required TResult Function(bool addBeer, bool addWine, bool addGame)
        updateUI,
    required TResult Function(CloudFailure failure) error,
  }) {
    return hangout(this.hangout);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Hangout hangout)? hangout,
    TResult? Function(bool addBeer, bool addWine, bool addGame)? updateUI,
    TResult? Function(CloudFailure failure)? error,
  }) {
    return hangout?.call(this.hangout);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Hangout hangout)? hangout,
    TResult Function(bool addBeer, bool addWine, bool addGame)? updateUI,
    TResult Function(CloudFailure failure)? error,
    required TResult orElse(),
  }) {
    if (hangout != null) {
      return hangout(this.hangout);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) hangout,
    required TResult Function(UpdateUI value) updateUI,
    required TResult Function(Error value) error,
  }) {
    return hangout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? hangout,
    TResult? Function(UpdateUI value)? updateUI,
    TResult? Function(Error value)? error,
  }) {
    return hangout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? hangout,
    TResult Function(UpdateUI value)? updateUI,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (hangout != null) {
      return hangout(this);
    }
    return orElse();
  }
}

abstract class Loaded extends HangoutStatsPageState {
  const factory Loaded(final Hangout hangout) = _$LoadedImpl;
  const Loaded._() : super._();

  Hangout get hangout;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateUIImplCopyWith<$Res> {
  factory _$$UpdateUIImplCopyWith(
          _$UpdateUIImpl value, $Res Function(_$UpdateUIImpl) then) =
      __$$UpdateUIImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool addBeer, bool addWine, bool addGame});
}

/// @nodoc
class __$$UpdateUIImplCopyWithImpl<$Res>
    extends _$HangoutStatsPageStateCopyWithImpl<$Res, _$UpdateUIImpl>
    implements _$$UpdateUIImplCopyWith<$Res> {
  __$$UpdateUIImplCopyWithImpl(
      _$UpdateUIImpl _value, $Res Function(_$UpdateUIImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addBeer = null,
    Object? addWine = null,
    Object? addGame = null,
  }) {
    return _then(_$UpdateUIImpl(
      addBeer: null == addBeer
          ? _value.addBeer
          : addBeer // ignore: cast_nullable_to_non_nullable
              as bool,
      addWine: null == addWine
          ? _value.addWine
          : addWine // ignore: cast_nullable_to_non_nullable
              as bool,
      addGame: null == addGame
          ? _value.addGame
          : addGame // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UpdateUIImpl extends UpdateUI {
  const _$UpdateUIImpl(
      {required this.addBeer, required this.addWine, required this.addGame})
      : super._();

  @override
  final bool addBeer;
  @override
  final bool addWine;
  @override
  final bool addGame;

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
    required TResult Function(Hangout hangout) hangout,
    required TResult Function(bool addBeer, bool addWine, bool addGame)
        updateUI,
    required TResult Function(CloudFailure failure) error,
  }) {
    return updateUI(addBeer, addWine, addGame);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Hangout hangout)? hangout,
    TResult? Function(bool addBeer, bool addWine, bool addGame)? updateUI,
    TResult? Function(CloudFailure failure)? error,
  }) {
    return updateUI?.call(addBeer, addWine, addGame);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Hangout hangout)? hangout,
    TResult Function(bool addBeer, bool addWine, bool addGame)? updateUI,
    TResult Function(CloudFailure failure)? error,
    required TResult orElse(),
  }) {
    if (updateUI != null) {
      return updateUI(addBeer, addWine, addGame);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) hangout,
    required TResult Function(UpdateUI value) updateUI,
    required TResult Function(Error value) error,
  }) {
    return updateUI(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? hangout,
    TResult? Function(UpdateUI value)? updateUI,
    TResult? Function(Error value)? error,
  }) {
    return updateUI?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? hangout,
    TResult Function(UpdateUI value)? updateUI,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (updateUI != null) {
      return updateUI(this);
    }
    return orElse();
  }
}

abstract class UpdateUI extends HangoutStatsPageState {
  const factory UpdateUI(
      {required final bool addBeer,
      required final bool addWine,
      required final bool addGame}) = _$UpdateUIImpl;
  const UpdateUI._() : super._();

  bool get addBeer;
  bool get addWine;
  bool get addGame;
  @JsonKey(ignore: true)
  _$$UpdateUIImplCopyWith<_$UpdateUIImpl> get copyWith =>
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
    extends _$HangoutStatsPageStateCopyWithImpl<$Res, _$ErrorImpl>
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
    required TResult Function(Hangout hangout) hangout,
    required TResult Function(bool addBeer, bool addWine, bool addGame)
        updateUI,
    required TResult Function(CloudFailure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(Hangout hangout)? hangout,
    TResult? Function(bool addBeer, bool addWine, bool addGame)? updateUI,
    TResult? Function(CloudFailure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Hangout hangout)? hangout,
    TResult Function(bool addBeer, bool addWine, bool addGame)? updateUI,
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
    required TResult Function(Loaded value) hangout,
    required TResult Function(UpdateUI value) updateUI,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? hangout,
    TResult? Function(UpdateUI value)? updateUI,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? hangout,
    TResult Function(UpdateUI value)? updateUI,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error extends HangoutStatsPageState {
  const factory Error(final CloudFailure failure) = _$ErrorImpl;
  const Error._() : super._();

  CloudFailure get failure;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
