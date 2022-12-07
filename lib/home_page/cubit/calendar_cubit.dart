import 'package:demo_meeting/home_page/network/dto/user_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../dpo/meeting_dpo.dart';
import '../network/mobile_repository.dart';

part 'calendar_cubit.freezed.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  final MobileRepository _repository;

  CalendarCubit(this._repository) : super(const CalendarState.initial());

  List<MeetingDpo> listMeeting = [];

  void getListUser() async {
    emit(const CalendarState.loading());
    final response = await _repository.getListUser();
    response.fold((left) {}, (right) {
      emit(CalendarState.userLoaded(right));
    });
  }

  void addMeeting(MeetingDpo meetingDpo){
    listMeeting.add(meetingDpo);
    emit(CalendarState.bookingListLoaded(listMeeting));
  }
}
