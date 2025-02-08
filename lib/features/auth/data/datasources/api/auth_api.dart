import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/network/api_response.dart';
import '../../dtos/login_request.dart';
import '../../dtos/register_request.dart';
import '../../models/user_model.dart';

part 'auth_api.g.dart';

@RestApi()
@injectable
abstract class AuthApi {
  @factoryMethod
  factory AuthApi(Dio dio) = _AuthApi;

  @POST('auth/register')
  Future<ApiResponse<UserModel>> register(
      @Body() RegisterRequest registerRequest);

  @POST('auth/login')
  Future<ApiResponse<UserModel>> login(@Body() LoginRequest loginRequest);
}
