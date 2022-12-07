import 'package:demo_meeting/home_page/network/api_failure/api_failure.dart';
import 'package:demo_meeting/home_page/network/dto/user_dto.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class MobileRepository {
  final _dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api/'));

  Future<Either<ApiFailure, UserDto>> getListUser() async {
    try {
      final response = await _dio.get('/character/');
      return Right(UserDto.fromJson(response.data));
    } on DioError catch (e) {
      return Left(ApiFailure.serverError(e.toString()));
    }
  }
}
