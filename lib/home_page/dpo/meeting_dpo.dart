import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting_dpo.freezed.dart';

@freezed
class MeetingDpo with _$MeetingDpo {
  const MeetingDpo._();

  factory MeetingDpo({
    required String eventId,
    required String eventName,
    required Color backgroundColor,
    required String eventDay,
    String? eventDuration,
    String? joinUrl,
    @Default(false) bool isAllDay,
    String? instruction,
  }) = _MeetingDpo;
}