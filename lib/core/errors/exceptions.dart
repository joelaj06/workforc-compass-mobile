import 'package:get/get.dart';

import '../presentation/routes/app_routes.dart';
import '../presentation/utils/app_snack.dart';



class AppException implements Exception {
  AppException([this.message, this.stackTrace = StackTrace.empty]);

  final String? message;
  final StackTrace? stackTrace;

  @override
  String toString() =>
      message == null ? '$runtimeType' : '$runtimeType($message)';
}

class ServerException extends AppException {
  ServerException(String? message) : super(message);
}

class CacheException extends AppException {
  CacheException(String? message) : super(message);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException({String? message}) : super(message){
    postUnAuthorized();
  }
  void postUnAuthorized() async {
   /* final AuthLocalDataSource authLocalDataSource = Get.find<AuthLocalDataSource>();
    await authLocalDataSource.deleteAuthResponse();*/
    AppSnack.show(title: 'Sign in',message:  'You need to sign in to continue',
     status: SnackStatus.error);
    await Get.toNamed(AppRoutes.login,);

  }


}
