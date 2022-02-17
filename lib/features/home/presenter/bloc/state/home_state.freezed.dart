// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  Initial initial({bool showLoading = false, bool isSubscribe = false}) {
    return Initial(
      showLoading: showLoading,
      isSubscribe: isSubscribe,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  bool get showLoading => throw _privateConstructorUsedError;
  bool get isSubscribe => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool showLoading, bool isSubscribe) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool showLoading, bool isSubscribe)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool showLoading, bool isSubscribe)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call({bool showLoading, bool isSubscribe});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? showLoading = freezed,
    Object? isSubscribe = freezed,
  }) {
    return _then(_value.copyWith(
      showLoading: showLoading == freezed
          ? _value.showLoading
          : showLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubscribe: isSubscribe == freezed
          ? _value.isSubscribe
          : isSubscribe // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class $InitialCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
  @override
  $Res call({bool showLoading, bool isSubscribe});
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;

  @override
  $Res call({
    Object? showLoading = freezed,
    Object? isSubscribe = freezed,
  }) {
    return _then(Initial(
      showLoading: showLoading == freezed
          ? _value.showLoading
          : showLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubscribe: isSubscribe == freezed
          ? _value.isSubscribe
          : isSubscribe // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial({this.showLoading = false, this.isSubscribe = false});

  @JsonKey(defaultValue: false)
  @override
  final bool showLoading;
  @JsonKey(defaultValue: false)
  @override
  final bool isSubscribe;

  @override
  String toString() {
    return 'HomeState.initial(showLoading: $showLoading, isSubscribe: $isSubscribe)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Initial &&
            (identical(other.showLoading, showLoading) ||
                const DeepCollectionEquality()
                    .equals(other.showLoading, showLoading)) &&
            (identical(other.isSubscribe, isSubscribe) ||
                const DeepCollectionEquality()
                    .equals(other.isSubscribe, isSubscribe)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(showLoading) ^
      const DeepCollectionEquality().hash(isSubscribe);

  @JsonKey(ignore: true)
  @override
  $InitialCopyWith<Initial> get copyWith =>
      _$InitialCopyWithImpl<Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool showLoading, bool isSubscribe) initial,
  }) {
    return initial(showLoading, isSubscribe);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool showLoading, bool isSubscribe)? initial,
  }) {
    return initial?.call(showLoading, isSubscribe);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool showLoading, bool isSubscribe)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(showLoading, isSubscribe);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements HomeState {
  const factory Initial({bool showLoading, bool isSubscribe}) = _$Initial;

  @override
  bool get showLoading => throw _privateConstructorUsedError;
  @override
  bool get isSubscribe => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $InitialCopyWith<Initial> get copyWith => throw _privateConstructorUsedError;
}
