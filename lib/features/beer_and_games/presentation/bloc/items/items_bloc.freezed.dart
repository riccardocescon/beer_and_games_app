// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'items_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ItemsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() download,
    required TResult Function(String name, List<int>? imageBytes) insertBeer,
    required TResult Function(
            RateableItem item, String userEmail, Rating rating)
        updateRating,
    required TResult Function(RateableItem item) updateInfo,
    required TResult Function(RateableItem item) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? download,
    TResult? Function(String name, List<int>? imageBytes)? insertBeer,
    TResult? Function(RateableItem item, String userEmail, Rating rating)?
        updateRating,
    TResult? Function(RateableItem item)? updateInfo,
    TResult? Function(RateableItem item)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? download,
    TResult Function(String name, List<int>? imageBytes)? insertBeer,
    TResult Function(RateableItem item, String userEmail, Rating rating)?
        updateRating,
    TResult Function(RateableItem item)? updateInfo,
    TResult Function(RateableItem item)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Download value) download,
    required TResult Function(InsertBeer value) insertBeer,
    required TResult Function(UpdateRating value) updateRating,
    required TResult Function(UpdateInfo value) updateInfo,
    required TResult Function(Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Download value)? download,
    TResult? Function(InsertBeer value)? insertBeer,
    TResult? Function(UpdateRating value)? updateRating,
    TResult? Function(UpdateInfo value)? updateInfo,
    TResult? Function(Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Download value)? download,
    TResult Function(InsertBeer value)? insertBeer,
    TResult Function(UpdateRating value)? updateRating,
    TResult Function(UpdateInfo value)? updateInfo,
    TResult Function(Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemsEventCopyWith<$Res> {
  factory $ItemsEventCopyWith(
          ItemsEvent value, $Res Function(ItemsEvent) then) =
      _$ItemsEventCopyWithImpl<$Res, ItemsEvent>;
}

/// @nodoc
class _$ItemsEventCopyWithImpl<$Res, $Val extends ItemsEvent>
    implements $ItemsEventCopyWith<$Res> {
  _$ItemsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DownloadImplCopyWith<$Res> {
  factory _$$DownloadImplCopyWith(
          _$DownloadImpl value, $Res Function(_$DownloadImpl) then) =
      __$$DownloadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownloadImplCopyWithImpl<$Res>
    extends _$ItemsEventCopyWithImpl<$Res, _$DownloadImpl>
    implements _$$DownloadImplCopyWith<$Res> {
  __$$DownloadImplCopyWithImpl(
      _$DownloadImpl _value, $Res Function(_$DownloadImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownloadImpl extends Download {
  const _$DownloadImpl() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() download,
    required TResult Function(String name, List<int>? imageBytes) insertBeer,
    required TResult Function(
            RateableItem item, String userEmail, Rating rating)
        updateRating,
    required TResult Function(RateableItem item) updateInfo,
    required TResult Function(RateableItem item) delete,
  }) {
    return download();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? download,
    TResult? Function(String name, List<int>? imageBytes)? insertBeer,
    TResult? Function(RateableItem item, String userEmail, Rating rating)?
        updateRating,
    TResult? Function(RateableItem item)? updateInfo,
    TResult? Function(RateableItem item)? delete,
  }) {
    return download?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? download,
    TResult Function(String name, List<int>? imageBytes)? insertBeer,
    TResult Function(RateableItem item, String userEmail, Rating rating)?
        updateRating,
    TResult Function(RateableItem item)? updateInfo,
    TResult Function(RateableItem item)? delete,
    required TResult orElse(),
  }) {
    if (download != null) {
      return download();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Download value) download,
    required TResult Function(InsertBeer value) insertBeer,
    required TResult Function(UpdateRating value) updateRating,
    required TResult Function(UpdateInfo value) updateInfo,
    required TResult Function(Delete value) delete,
  }) {
    return download(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Download value)? download,
    TResult? Function(InsertBeer value)? insertBeer,
    TResult? Function(UpdateRating value)? updateRating,
    TResult? Function(UpdateInfo value)? updateInfo,
    TResult? Function(Delete value)? delete,
  }) {
    return download?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Download value)? download,
    TResult Function(InsertBeer value)? insertBeer,
    TResult Function(UpdateRating value)? updateRating,
    TResult Function(UpdateInfo value)? updateInfo,
    TResult Function(Delete value)? delete,
    required TResult orElse(),
  }) {
    if (download != null) {
      return download(this);
    }
    return orElse();
  }
}

abstract class Download extends ItemsEvent {
  const factory Download() = _$DownloadImpl;
  const Download._() : super._();
}

/// @nodoc
abstract class _$$InsertBeerImplCopyWith<$Res> {
  factory _$$InsertBeerImplCopyWith(
          _$InsertBeerImpl value, $Res Function(_$InsertBeerImpl) then) =
      __$$InsertBeerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, List<int>? imageBytes});
}

/// @nodoc
class __$$InsertBeerImplCopyWithImpl<$Res>
    extends _$ItemsEventCopyWithImpl<$Res, _$InsertBeerImpl>
    implements _$$InsertBeerImplCopyWith<$Res> {
  __$$InsertBeerImplCopyWithImpl(
      _$InsertBeerImpl _value, $Res Function(_$InsertBeerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageBytes = freezed,
  }) {
    return _then(_$InsertBeerImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageBytes: freezed == imageBytes
          ? _value._imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc

class _$InsertBeerImpl extends InsertBeer {
  const _$InsertBeerImpl(
      {required this.name, required final List<int>? imageBytes})
      : _imageBytes = imageBytes,
        super._();

  @override
  final String name;
  final List<int>? _imageBytes;
  @override
  List<int>? get imageBytes {
    final value = _imageBytes;
    if (value == null) return null;
    if (_imageBytes is EqualUnmodifiableListView) return _imageBytes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsertBeerImplCopyWith<_$InsertBeerImpl> get copyWith =>
      __$$InsertBeerImplCopyWithImpl<_$InsertBeerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() download,
    required TResult Function(String name, List<int>? imageBytes) insertBeer,
    required TResult Function(
            RateableItem item, String userEmail, Rating rating)
        updateRating,
    required TResult Function(RateableItem item) updateInfo,
    required TResult Function(RateableItem item) delete,
  }) {
    return insertBeer(name, imageBytes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? download,
    TResult? Function(String name, List<int>? imageBytes)? insertBeer,
    TResult? Function(RateableItem item, String userEmail, Rating rating)?
        updateRating,
    TResult? Function(RateableItem item)? updateInfo,
    TResult? Function(RateableItem item)? delete,
  }) {
    return insertBeer?.call(name, imageBytes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? download,
    TResult Function(String name, List<int>? imageBytes)? insertBeer,
    TResult Function(RateableItem item, String userEmail, Rating rating)?
        updateRating,
    TResult Function(RateableItem item)? updateInfo,
    TResult Function(RateableItem item)? delete,
    required TResult orElse(),
  }) {
    if (insertBeer != null) {
      return insertBeer(name, imageBytes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Download value) download,
    required TResult Function(InsertBeer value) insertBeer,
    required TResult Function(UpdateRating value) updateRating,
    required TResult Function(UpdateInfo value) updateInfo,
    required TResult Function(Delete value) delete,
  }) {
    return insertBeer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Download value)? download,
    TResult? Function(InsertBeer value)? insertBeer,
    TResult? Function(UpdateRating value)? updateRating,
    TResult? Function(UpdateInfo value)? updateInfo,
    TResult? Function(Delete value)? delete,
  }) {
    return insertBeer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Download value)? download,
    TResult Function(InsertBeer value)? insertBeer,
    TResult Function(UpdateRating value)? updateRating,
    TResult Function(UpdateInfo value)? updateInfo,
    TResult Function(Delete value)? delete,
    required TResult orElse(),
  }) {
    if (insertBeer != null) {
      return insertBeer(this);
    }
    return orElse();
  }
}

abstract class InsertBeer extends ItemsEvent {
  const factory InsertBeer(
      {required final String name,
      required final List<int>? imageBytes}) = _$InsertBeerImpl;
  const InsertBeer._() : super._();

  String get name;
  List<int>? get imageBytes;
  @JsonKey(ignore: true)
  _$$InsertBeerImplCopyWith<_$InsertBeerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateRatingImplCopyWith<$Res> {
  factory _$$UpdateRatingImplCopyWith(
          _$UpdateRatingImpl value, $Res Function(_$UpdateRatingImpl) then) =
      __$$UpdateRatingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RateableItem item, String userEmail, Rating rating});
}

/// @nodoc
class __$$UpdateRatingImplCopyWithImpl<$Res>
    extends _$ItemsEventCopyWithImpl<$Res, _$UpdateRatingImpl>
    implements _$$UpdateRatingImplCopyWith<$Res> {
  __$$UpdateRatingImplCopyWithImpl(
      _$UpdateRatingImpl _value, $Res Function(_$UpdateRatingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? userEmail = null,
    Object? rating = null,
  }) {
    return _then(_$UpdateRatingImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as RateableItem,
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as Rating,
    ));
  }
}

/// @nodoc

class _$UpdateRatingImpl extends UpdateRating {
  const _$UpdateRatingImpl(
      {required this.item, required this.userEmail, required this.rating})
      : super._();

  @override
  final RateableItem item;
  @override
  final String userEmail;
  @override
  final Rating rating;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRatingImplCopyWith<_$UpdateRatingImpl> get copyWith =>
      __$$UpdateRatingImplCopyWithImpl<_$UpdateRatingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() download,
    required TResult Function(String name, List<int>? imageBytes) insertBeer,
    required TResult Function(
            RateableItem item, String userEmail, Rating rating)
        updateRating,
    required TResult Function(RateableItem item) updateInfo,
    required TResult Function(RateableItem item) delete,
  }) {
    return updateRating(item, userEmail, rating);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? download,
    TResult? Function(String name, List<int>? imageBytes)? insertBeer,
    TResult? Function(RateableItem item, String userEmail, Rating rating)?
        updateRating,
    TResult? Function(RateableItem item)? updateInfo,
    TResult? Function(RateableItem item)? delete,
  }) {
    return updateRating?.call(item, userEmail, rating);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? download,
    TResult Function(String name, List<int>? imageBytes)? insertBeer,
    TResult Function(RateableItem item, String userEmail, Rating rating)?
        updateRating,
    TResult Function(RateableItem item)? updateInfo,
    TResult Function(RateableItem item)? delete,
    required TResult orElse(),
  }) {
    if (updateRating != null) {
      return updateRating(item, userEmail, rating);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Download value) download,
    required TResult Function(InsertBeer value) insertBeer,
    required TResult Function(UpdateRating value) updateRating,
    required TResult Function(UpdateInfo value) updateInfo,
    required TResult Function(Delete value) delete,
  }) {
    return updateRating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Download value)? download,
    TResult? Function(InsertBeer value)? insertBeer,
    TResult? Function(UpdateRating value)? updateRating,
    TResult? Function(UpdateInfo value)? updateInfo,
    TResult? Function(Delete value)? delete,
  }) {
    return updateRating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Download value)? download,
    TResult Function(InsertBeer value)? insertBeer,
    TResult Function(UpdateRating value)? updateRating,
    TResult Function(UpdateInfo value)? updateInfo,
    TResult Function(Delete value)? delete,
    required TResult orElse(),
  }) {
    if (updateRating != null) {
      return updateRating(this);
    }
    return orElse();
  }
}

abstract class UpdateRating extends ItemsEvent {
  const factory UpdateRating(
      {required final RateableItem item,
      required final String userEmail,
      required final Rating rating}) = _$UpdateRatingImpl;
  const UpdateRating._() : super._();

  RateableItem get item;
  String get userEmail;
  Rating get rating;
  @JsonKey(ignore: true)
  _$$UpdateRatingImplCopyWith<_$UpdateRatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateInfoImplCopyWith<$Res> {
  factory _$$UpdateInfoImplCopyWith(
          _$UpdateInfoImpl value, $Res Function(_$UpdateInfoImpl) then) =
      __$$UpdateInfoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RateableItem item});
}

/// @nodoc
class __$$UpdateInfoImplCopyWithImpl<$Res>
    extends _$ItemsEventCopyWithImpl<$Res, _$UpdateInfoImpl>
    implements _$$UpdateInfoImplCopyWith<$Res> {
  __$$UpdateInfoImplCopyWithImpl(
      _$UpdateInfoImpl _value, $Res Function(_$UpdateInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$UpdateInfoImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as RateableItem,
    ));
  }
}

/// @nodoc

class _$UpdateInfoImpl extends UpdateInfo {
  const _$UpdateInfoImpl({required this.item}) : super._();

  @override
  final RateableItem item;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateInfoImplCopyWith<_$UpdateInfoImpl> get copyWith =>
      __$$UpdateInfoImplCopyWithImpl<_$UpdateInfoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() download,
    required TResult Function(String name, List<int>? imageBytes) insertBeer,
    required TResult Function(
            RateableItem item, String userEmail, Rating rating)
        updateRating,
    required TResult Function(RateableItem item) updateInfo,
    required TResult Function(RateableItem item) delete,
  }) {
    return updateInfo(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? download,
    TResult? Function(String name, List<int>? imageBytes)? insertBeer,
    TResult? Function(RateableItem item, String userEmail, Rating rating)?
        updateRating,
    TResult? Function(RateableItem item)? updateInfo,
    TResult? Function(RateableItem item)? delete,
  }) {
    return updateInfo?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? download,
    TResult Function(String name, List<int>? imageBytes)? insertBeer,
    TResult Function(RateableItem item, String userEmail, Rating rating)?
        updateRating,
    TResult Function(RateableItem item)? updateInfo,
    TResult Function(RateableItem item)? delete,
    required TResult orElse(),
  }) {
    if (updateInfo != null) {
      return updateInfo(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Download value) download,
    required TResult Function(InsertBeer value) insertBeer,
    required TResult Function(UpdateRating value) updateRating,
    required TResult Function(UpdateInfo value) updateInfo,
    required TResult Function(Delete value) delete,
  }) {
    return updateInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Download value)? download,
    TResult? Function(InsertBeer value)? insertBeer,
    TResult? Function(UpdateRating value)? updateRating,
    TResult? Function(UpdateInfo value)? updateInfo,
    TResult? Function(Delete value)? delete,
  }) {
    return updateInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Download value)? download,
    TResult Function(InsertBeer value)? insertBeer,
    TResult Function(UpdateRating value)? updateRating,
    TResult Function(UpdateInfo value)? updateInfo,
    TResult Function(Delete value)? delete,
    required TResult orElse(),
  }) {
    if (updateInfo != null) {
      return updateInfo(this);
    }
    return orElse();
  }
}

abstract class UpdateInfo extends ItemsEvent {
  const factory UpdateInfo({required final RateableItem item}) =
      _$UpdateInfoImpl;
  const UpdateInfo._() : super._();

  RateableItem get item;
  @JsonKey(ignore: true)
  _$$UpdateInfoImplCopyWith<_$UpdateInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RateableItem item});
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$ItemsEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$DeleteImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as RateableItem,
    ));
  }
}

/// @nodoc

class _$DeleteImpl extends Delete {
  const _$DeleteImpl({required this.item}) : super._();

  @override
  final RateableItem item;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() download,
    required TResult Function(String name, List<int>? imageBytes) insertBeer,
    required TResult Function(
            RateableItem item, String userEmail, Rating rating)
        updateRating,
    required TResult Function(RateableItem item) updateInfo,
    required TResult Function(RateableItem item) delete,
  }) {
    return delete(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? download,
    TResult? Function(String name, List<int>? imageBytes)? insertBeer,
    TResult? Function(RateableItem item, String userEmail, Rating rating)?
        updateRating,
    TResult? Function(RateableItem item)? updateInfo,
    TResult? Function(RateableItem item)? delete,
  }) {
    return delete?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? download,
    TResult Function(String name, List<int>? imageBytes)? insertBeer,
    TResult Function(RateableItem item, String userEmail, Rating rating)?
        updateRating,
    TResult Function(RateableItem item)? updateInfo,
    TResult Function(RateableItem item)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Download value) download,
    required TResult Function(InsertBeer value) insertBeer,
    required TResult Function(UpdateRating value) updateRating,
    required TResult Function(UpdateInfo value) updateInfo,
    required TResult Function(Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Download value)? download,
    TResult? Function(InsertBeer value)? insertBeer,
    TResult? Function(UpdateRating value)? updateRating,
    TResult? Function(UpdateInfo value)? updateInfo,
    TResult? Function(Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Download value)? download,
    TResult Function(InsertBeer value)? insertBeer,
    TResult Function(UpdateRating value)? updateRating,
    TResult Function(UpdateInfo value)? updateInfo,
    TResult Function(Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class Delete extends ItemsEvent {
  const factory Delete({required final RateableItem item}) = _$DeleteImpl;
  const Delete._() : super._();

  RateableItem get item;
  @JsonKey(ignore: true)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ItemsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(
            List<Game> games, List<Beer> beers, List<Wine> wines)
        update,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(List<Game> games, List<Beer> beers, List<Wine> wines)?
        update,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<Game> games, List<Beer> beers, List<Wine> wines)?
        update,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Update value) update,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Update value)? update,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Update value)? update,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemsStateCopyWith<$Res> {
  factory $ItemsStateCopyWith(
          ItemsState value, $Res Function(ItemsState) then) =
      _$ItemsStateCopyWithImpl<$Res, ItemsState>;
}

/// @nodoc
class _$ItemsStateCopyWithImpl<$Res, $Val extends ItemsState>
    implements $ItemsStateCopyWith<$Res> {
  _$ItemsStateCopyWithImpl(this._value, this._then);

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
    extends _$ItemsStateCopyWithImpl<$Res, _$InitImpl>
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
            List<Game> games, List<Beer> beers, List<Wine> wines)
        update,
    required TResult Function(Failure failure) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(List<Game> games, List<Beer> beers, List<Wine> wines)?
        update,
    TResult? Function(Failure failure)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<Game> games, List<Beer> beers, List<Wine> wines)?
        update,
    TResult Function(Failure failure)? error,
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
    required TResult Function(Update value) update,
    required TResult Function(Error value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Update value)? update,
    TResult? Function(Error value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Update value)? update,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init extends ItemsState {
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
    extends _$ItemsStateCopyWithImpl<$Res, _$LoadingImpl>
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
            List<Game> games, List<Beer> beers, List<Wine> wines)
        update,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(List<Game> games, List<Beer> beers, List<Wine> wines)?
        update,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<Game> games, List<Beer> beers, List<Wine> wines)?
        update,
    TResult Function(Failure failure)? error,
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
    required TResult Function(Update value) update,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Update value)? update,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Update value)? update,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading extends ItemsState {
  const factory Loading() = _$LoadingImpl;
  const Loading._() : super._();
}

/// @nodoc
abstract class _$$UpdateImplCopyWith<$Res> {
  factory _$$UpdateImplCopyWith(
          _$UpdateImpl value, $Res Function(_$UpdateImpl) then) =
      __$$UpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Game> games, List<Beer> beers, List<Wine> wines});
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$ItemsStateCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? games = null,
    Object? beers = null,
    Object? wines = null,
  }) {
    return _then(_$UpdateImpl(
      games: null == games
          ? _value._games
          : games // ignore: cast_nullable_to_non_nullable
              as List<Game>,
      beers: null == beers
          ? _value._beers
          : beers // ignore: cast_nullable_to_non_nullable
              as List<Beer>,
      wines: null == wines
          ? _value._wines
          : wines // ignore: cast_nullable_to_non_nullable
              as List<Wine>,
    ));
  }
}

/// @nodoc

class _$UpdateImpl extends Update {
  const _$UpdateImpl(
      {required final List<Game> games,
      required final List<Beer> beers,
      required final List<Wine> wines})
      : _games = games,
        _beers = beers,
        _wines = wines,
        super._();

  final List<Game> _games;
  @override
  List<Game> get games {
    if (_games is EqualUnmodifiableListView) return _games;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_games);
  }

  final List<Beer> _beers;
  @override
  List<Beer> get beers {
    if (_beers is EqualUnmodifiableListView) return _beers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_beers);
  }

  final List<Wine> _wines;
  @override
  List<Wine> get wines {
    if (_wines is EqualUnmodifiableListView) return _wines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wines);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      __$$UpdateImplCopyWithImpl<_$UpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(
            List<Game> games, List<Beer> beers, List<Wine> wines)
        update,
    required TResult Function(Failure failure) error,
  }) {
    return update(games, beers, wines);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(List<Game> games, List<Beer> beers, List<Wine> wines)?
        update,
    TResult? Function(Failure failure)? error,
  }) {
    return update?.call(games, beers, wines);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<Game> games, List<Beer> beers, List<Wine> wines)?
        update,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(games, beers, wines);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Update value) update,
    required TResult Function(Error value) error,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Update value)? update,
    TResult? Function(Error value)? error,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Update value)? update,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class Update extends ItemsState {
  const factory Update(
      {required final List<Game> games,
      required final List<Beer> beers,
      required final List<Wine> wines}) = _$UpdateImpl;
  const Update._() : super._();

  List<Game> get games;
  List<Beer> get beers;
  List<Wine> get wines;
  @JsonKey(ignore: true)
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ItemsStateCopyWithImpl<$Res, _$ErrorImpl>
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
              as Failure,
    ));
  }
}

/// @nodoc

class _$ErrorImpl extends Error {
  const _$ErrorImpl(this.failure) : super._();

  @override
  final Failure failure;

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
            List<Game> games, List<Beer> beers, List<Wine> wines)
        update,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(List<Game> games, List<Beer> beers, List<Wine> wines)?
        update,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(List<Game> games, List<Beer> beers, List<Wine> wines)?
        update,
    TResult Function(Failure failure)? error,
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
    required TResult Function(Update value) update,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Update value)? update,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Update value)? update,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error extends ItemsState {
  const factory Error(final Failure failure) = _$ErrorImpl;
  const Error._() : super._();

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
