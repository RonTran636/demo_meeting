part of 'calendar_cubit.dart';

@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState.initial() = _Initial;

  const factory CalendarState.loading() = _Loading;

  const factory CalendarState.userLoaded(UserDto userDto) = _UserLoaded;

  const factory CalendarState.bookingListLoaded(List<MeetingDpo> listMeetingDpo) = _ListLoaded;

  //Network error
  const factory CalendarState.connectivityError() = _ConnectivityError;

  const factory CalendarState.serverError(String errorMessage) = _ServerError;
}
