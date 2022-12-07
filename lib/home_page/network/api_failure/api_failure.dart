import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_failure.freezed.dart';

@freezed
class ApiFailure with _$ApiFailure {
  //Network error
  const factory ApiFailure.connectivityError() = _ConnectivityError;

  const factory ApiFailure.serverError(String errorMessage) = _ServerError;
}