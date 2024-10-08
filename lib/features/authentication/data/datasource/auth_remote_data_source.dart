import 'package:work_compass/features/authentication/data/models/request/password_reset/password_reset_request.dart';
import '../models/request/login/login_request.dart';
import '../models/request/user/user_request.dart';
import '../models/response/generic/message_response.dart';
import '../models/response/login/login_response.dart';
import '../models/response/user/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(LoginRequest request);
  Future<User> fetchUser(String userId);
  Future<User> updateUser({ required String userId,required UserRequest userRequest});
  Future<MessageResponse> logout();
  Future<User> addUser({required UserRequest userRequest});
  Future<MessageResponse> passwordReset( {required PasswordResetRequest resetRequest});
}
