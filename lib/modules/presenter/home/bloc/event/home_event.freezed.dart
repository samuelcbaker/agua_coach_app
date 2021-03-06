// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeEventTearOff {
  const _$HomeEventTearOff();

  HomeInitEvent init() {
    return const HomeInitEvent();
  }

  ChangeSubscribeNotificationEvent changeSubscribeNotification(bool value) {
    return ChangeSubscribeNotificationEvent(
      value,
    );
  }
}

/// @nodoc
const $HomeEvent = _$HomeEventTearOff();

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool value) changeSubscribeNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool value)? changeSubscribeNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool value)? changeSubscribeNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInitEvent value) init,
    required TResult Function(ChangeSubscribeNotificationEvent value)
        changeSubscribeNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeInitEvent value)? init,
    TResult Function(ChangeSubscribeNotificationEvent value)?
        changeSubscribeNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitEvent value)? init,
    TResult Function(ChangeSubscribeNotificationEvent value)?
        changeSubscribeNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res> implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  final HomeEvent _value;
  // ignore: unused_field
  final $Res Function(HomeEvent) _then;
}

/// @nodoc
abstract class $HomeInitEventCopyWith<$Res> {
  factory $HomeInitEventCopyWith(
          HomeInitEvent value, $Res Function(HomeInitEvent) then) =
      _$HomeInitEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeInitEventCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements $HomeInitEventCopyWith<$Res> {
  _$HomeInitEventCopyWithImpl(
      HomeInitEvent _value, $Res Function(HomeInitEvent) _then)
      : super(_value, (v) => _then(v as HomeInitEvent));

  @override
  HomeInitEvent get _value => super._value as HomeInitEvent;
}

/// @nodoc

class _$HomeInitEvent implements HomeInitEvent {
  const _$HomeInitEvent();

  @override
  String toString() {
    return 'HomeEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HomeInitEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool value) changeSubscribeNotification,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool value)? changeSubscribeNotification,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool value)? changeSubscribeNotification,
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
    required TResult Function(HomeInitEvent value) init,
    required TResult Function(ChangeSubscribeNotificationEvent value)
        changeSubscribeNotification,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeInitEvent value)? init,
    TResult Function(ChangeSubscribeNotificationEvent value)?
        changeSubscribeNotification,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitEvent value)? init,
    TResult Function(ChangeSubscribeNotificationEvent value)?
        changeSubscribeNotification,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class HomeInitEvent implements HomeEvent {
  const factory HomeInitEvent() = _$HomeInitEvent;
}

/// @nodoc
abstract class $ChangeSubscribeNotificationEventCopyWith<$Res> {
  factory $ChangeSubscribeNotificationEventCopyWith(
          ChangeSubscribeNotificationEvent value,
          $Res Function(ChangeSubscribeNotificationEvent) then) =
      _$ChangeSubscribeNotificationEventCopyWithImpl<$Res>;
  $Res call({bool value});
}

/// @nodoc
class _$ChangeSubscribeNotificationEventCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res>
    implements $ChangeSubscribeNotificationEventCopyWith<$Res> {
  _$ChangeSubscribeNotificationEventCopyWithImpl(
      ChangeSubscribeNotificationEvent _value,
      $Res Function(ChangeSubscribeNotificationEvent) _then)
      : super(_value, (v) => _then(v as ChangeSubscribeNotificationEvent));

  @override
  ChangeSubscribeNotificationEvent get _value =>
      super._value as ChangeSubscribeNotificationEvent;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(ChangeSubscribeNotificationEvent(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChangeSubscribeNotificationEvent
    implements ChangeSubscribeNotificationEvent {
  const _$ChangeSubscribeNotificationEvent(this.value);

  @override
  final bool value;

  @override
  String toString() {
    return 'HomeEvent.changeSubscribeNotification(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeSubscribeNotificationEvent &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  $ChangeSubscribeNotificationEventCopyWith<ChangeSubscribeNotificationEvent>
      get copyWith => _$ChangeSubscribeNotificationEventCopyWithImpl<
          ChangeSubscribeNotificationEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool value) changeSubscribeNotification,
  }) {
    return changeSubscribeNotification(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool value)? changeSubscribeNotification,
  }) {
    return changeSubscribeNotification?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool value)? changeSubscribeNotification,
    required TResult orElse(),
  }) {
    if (changeSubscribeNotification != null) {
      return changeSubscribeNotification(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInitEvent value) init,
    required TResult Function(ChangeSubscribeNotificationEvent value)
        changeSubscribeNotification,
  }) {
    return changeSubscribeNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeInitEvent value)? init,
    TResult Function(ChangeSubscribeNotificationEvent value)?
        changeSubscribeNotification,
  }) {
    return changeSubscribeNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitEvent value)? init,
    TResult Function(ChangeSubscribeNotificationEvent value)?
        changeSubscribeNotification,
    required TResult orElse(),
  }) {
    if (changeSubscribeNotification != null) {
      return changeSubscribeNotification(this);
    }
    return orElse();
  }
}

abstract class ChangeSubscribeNotificationEvent implements HomeEvent {
  const factory ChangeSubscribeNotificationEvent(bool value) =
      _$ChangeSubscribeNotificationEvent;

  bool get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangeSubscribeNotificationEventCopyWith<ChangeSubscribeNotificationEvent>
      get copyWith => throw _privateConstructorUsedError;
}
