// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meeting_dpo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MeetingDpo {
  String get eventId => throw _privateConstructorUsedError;
  String get eventName => throw _privateConstructorUsedError;
  Color get backgroundColor => throw _privateConstructorUsedError;
  String get eventDay => throw _privateConstructorUsedError;
  String? get eventDuration => throw _privateConstructorUsedError;
  String? get joinUrl => throw _privateConstructorUsedError;
  bool get isAllDay => throw _privateConstructorUsedError;
  String? get instruction => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MeetingDpoCopyWith<MeetingDpo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeetingDpoCopyWith<$Res> {
  factory $MeetingDpoCopyWith(
          MeetingDpo value, $Res Function(MeetingDpo) then) =
      _$MeetingDpoCopyWithImpl<$Res, MeetingDpo>;
  @useResult
  $Res call(
      {String eventId,
      String eventName,
      Color backgroundColor,
      String eventDay,
      String? eventDuration,
      String? joinUrl,
      bool isAllDay,
      String? instruction});
}

/// @nodoc
class _$MeetingDpoCopyWithImpl<$Res, $Val extends MeetingDpo>
    implements $MeetingDpoCopyWith<$Res> {
  _$MeetingDpoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? eventName = null,
    Object? backgroundColor = null,
    Object? eventDay = null,
    Object? eventDuration = freezed,
    Object? joinUrl = freezed,
    Object? isAllDay = null,
    Object? instruction = freezed,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      eventDay: null == eventDay
          ? _value.eventDay
          : eventDay // ignore: cast_nullable_to_non_nullable
              as String,
      eventDuration: freezed == eventDuration
          ? _value.eventDuration
          : eventDuration // ignore: cast_nullable_to_non_nullable
              as String?,
      joinUrl: freezed == joinUrl
          ? _value.joinUrl
          : joinUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isAllDay: null == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
      instruction: freezed == instruction
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MeetingDpoCopyWith<$Res>
    implements $MeetingDpoCopyWith<$Res> {
  factory _$$_MeetingDpoCopyWith(
          _$_MeetingDpo value, $Res Function(_$_MeetingDpo) then) =
      __$$_MeetingDpoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      String eventName,
      Color backgroundColor,
      String eventDay,
      String? eventDuration,
      String? joinUrl,
      bool isAllDay,
      String? instruction});
}

/// @nodoc
class __$$_MeetingDpoCopyWithImpl<$Res>
    extends _$MeetingDpoCopyWithImpl<$Res, _$_MeetingDpo>
    implements _$$_MeetingDpoCopyWith<$Res> {
  __$$_MeetingDpoCopyWithImpl(
      _$_MeetingDpo _value, $Res Function(_$_MeetingDpo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? eventName = null,
    Object? backgroundColor = null,
    Object? eventDay = null,
    Object? eventDuration = freezed,
    Object? joinUrl = freezed,
    Object? isAllDay = null,
    Object? instruction = freezed,
  }) {
    return _then(_$_MeetingDpo(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      eventDay: null == eventDay
          ? _value.eventDay
          : eventDay // ignore: cast_nullable_to_non_nullable
              as String,
      eventDuration: freezed == eventDuration
          ? _value.eventDuration
          : eventDuration // ignore: cast_nullable_to_non_nullable
              as String?,
      joinUrl: freezed == joinUrl
          ? _value.joinUrl
          : joinUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isAllDay: null == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
      instruction: freezed == instruction
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_MeetingDpo extends _MeetingDpo {
  _$_MeetingDpo(
      {required this.eventId,
      required this.eventName,
      required this.backgroundColor,
      required this.eventDay,
      this.eventDuration,
      this.joinUrl,
      this.isAllDay = false,
      this.instruction})
      : super._();

  @override
  final String eventId;
  @override
  final String eventName;
  @override
  final Color backgroundColor;
  @override
  final String eventDay;
  @override
  final String? eventDuration;
  @override
  final String? joinUrl;
  @override
  @JsonKey()
  final bool isAllDay;
  @override
  final String? instruction;

  @override
  String toString() {
    return 'MeetingDpo(eventId: $eventId, eventName: $eventName, backgroundColor: $backgroundColor, eventDay: $eventDay, eventDuration: $eventDuration, joinUrl: $joinUrl, isAllDay: $isAllDay, instruction: $instruction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MeetingDpo &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.eventDay, eventDay) ||
                other.eventDay == eventDay) &&
            (identical(other.eventDuration, eventDuration) ||
                other.eventDuration == eventDuration) &&
            (identical(other.joinUrl, joinUrl) || other.joinUrl == joinUrl) &&
            (identical(other.isAllDay, isAllDay) ||
                other.isAllDay == isAllDay) &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, eventName,
      backgroundColor, eventDay, eventDuration, joinUrl, isAllDay, instruction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MeetingDpoCopyWith<_$_MeetingDpo> get copyWith =>
      __$$_MeetingDpoCopyWithImpl<_$_MeetingDpo>(this, _$identity);
}

abstract class _MeetingDpo extends MeetingDpo {
  factory _MeetingDpo(
      {required final String eventId,
      required final String eventName,
      required final Color backgroundColor,
      required final String eventDay,
      final String? eventDuration,
      final String? joinUrl,
      final bool isAllDay,
      final String? instruction}) = _$_MeetingDpo;
  _MeetingDpo._() : super._();

  @override
  String get eventId;
  @override
  String get eventName;
  @override
  Color get backgroundColor;
  @override
  String get eventDay;
  @override
  String? get eventDuration;
  @override
  String? get joinUrl;
  @override
  bool get isAllDay;
  @override
  String? get instruction;
  @override
  @JsonKey(ignore: true)
  _$$_MeetingDpoCopyWith<_$_MeetingDpo> get copyWith =>
      throw _privateConstructorUsedError;
}
