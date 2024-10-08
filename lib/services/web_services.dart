import 'package:api_practice/models/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: "https://gorest.co.in/public/v2/")
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;
  @GET('users')
  Future<List<Users>> getAllUsers();

  @GET('/users/{id}')
  Future<Users> getUserById(@Path() int id);

  @POST('users')
  Future<Users> createUser(
      @Body() Users newUser, @Header('Authorization') String token);

  @DELETE('users/{id}')
  Future<dynamic> deleteUser(
      @Path() int id, @Header('Authorization') String token);
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio.options.connectTimeout = const Duration(seconds: 30);
  dio.options.receiveTimeout = const Duration(seconds: 30);
  dio.interceptors.add(
    LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      responseBody: true,
      requestHeader: false,
      responseHeader: false,
    ),
  );
  return dio;
}
