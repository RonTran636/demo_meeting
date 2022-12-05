import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../dpo/meeting_dpo.dart';

part 'calendar_cubit.freezed.dart';
part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  // final MobileRepository _repository;

  CalendarCubit() : super(const CalendarState.initial());

  List<MeetingDpo> listMeeting = [];

  List<MeetingDpo> schoolEvents = [];

  late String schoolId;

  void getPtcBookingTeacher({required String teacherId}) async {
    emit(const CalendarState.loading());
    // final response = await _repository.getPtcBookingTeacher(teacherId: teacherId);
    // response.fold(
    //   (left) => left.when(
    //     connectivityError: () => emit(const CalendarState.connectivityError()),
    //     serverError: (message) => emit(CalendarState.serverError(message)),
    //   ),
    //   (result) {
    //     final _ptcBookingList =
    //         result.map((e) => MeetingDpo.fromDto(e, result.indexOf(e))).toList();
    //     listMeeting = schoolEvents + _ptcBookingList;
    //     emit(CalendarState.bookingListLoaded(listMeeting));
    //   },
    // );
  }

  void getPtcBookingParent({
    required String studentId,
    required String parentId,
  }) async {
    emit(const CalendarState.loading());
    // final response = await _repository.getPtcBookingParent(
    //   schoolId: schoolId,
    //   studentId: studentId,
    //   parentId: parentId,
    // );
    // response.fold(
    //   (left) => left.when(
    //     connectivityError: () => emit(const CalendarState.connectivityError()),
    //     serverError: (message) => emit(CalendarState.serverError(message)),
    //   ),
    //   (result) {
    //     final _ptcBookingList =
    //         result.map((e) => MeetingDpo.fromDto(e, result.indexOf(e))).toList();
    //     listMeeting = schoolEvents + _ptcBookingList;
    //     emit(CalendarState.bookingListLoaded(listMeeting));
    //   },
    // );
  }

  Future<void> getSchoolEvents({
    required String schoolId,
    required DateTime selectedTime,
  }) async {
    emit(const CalendarState.loading());
    // final _month = selectedTime.month;
    // final response = await _repository.getSchoolEvents(schoolId: schoolId, monthOfYear: _month);
    // response.fold(
    //   (left) => left.when(
    //     connectivityError: () => emit(const CalendarState.connectivityError()),
    //     serverError: (message) => emit(CalendarState.serverError(message)),
    //   ),
    //   (result) {
    //     schoolEvents.addAll(result.map((e) => MeetingDpo.fromDto(e, result.indexOf(e))).toList());
    //     emit(CalendarState.bookingListLoaded(schoolEvents));
    //   },
    // );
  }
}
