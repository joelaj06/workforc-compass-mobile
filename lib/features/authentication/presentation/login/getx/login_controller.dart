
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:work_compass/features/authentication/data/domain/usecase/load_user.dart';

import '../../../../../core/errors/failure.dart';

import '../../../../../core/presentation/routes/app_routes.dart';
import '../../../../../core/presentation/widgets/app_snacks.dart';
import '../../../../../core/utils/shared_preferences_wrapper.dart';
import '../../../data/domain/usecase/login_user.dart';
import '../../../data/models/request/login/login_request.dart';
import '../../../data/models/response/user/user_model.dart';

class LoginController extends GetxController{
  LoginController({required this.loginUser,
  required this.loadUser,});

  final LoginUser loginUser;
  final LoadUser loadUser;

  //text editing controllers
  RxBool showPassword = false.obs;
  RxBool isLoading = false.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;


  final SharedPreferencesWrapper _sharedPreferencesWrapper = Get.find();



  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() async {
    // ignore: unawaited_futures
    isLoading(true);

    final Either<Failure, User> failureOrUser = await loadUser(null);

    // ignore: unawaited_futures
    failureOrUser.fold(
          (Failure failure) {
        isLoading(false);
        // AppSnacks().showSuccess('Login', failure.message);
      },
          (User user) {
        isLoading(false);
        Get.offAllNamed<void>(AppRoutes.base);
      },
    );
  }

  void login(BuildContext context) async {
    // ignore: unawaited_futures
    isLoading(true);
   /* final String token =
    await _sharedPreferencesWrapper.getString(SharedPrefsKeys.fcmToken);*/

    final Either<Failure, User> failureOrUser = await loginUser(
      LoginRequest(
          email: email.value,
          password: password.value,

      ),
    );
    // ignore: unawaited_futures
    failureOrUser.fold(
          (Failure failure) {
        isLoading(false);
        AppSnacks.showError('Login', failure.message);
      },
          (User user) {
        isLoading(false);
        AppSnacks.showSuccess('Login', 'You signed in successfully');
        Get.toNamed<dynamic>(AppRoutes.base);
      },
    );
  }

  void navigateToSignUpScreen() async{
    final dynamic result = await Get.toNamed<dynamic>(AppRoutes.signup);
    if(result != null){
      AppSnacks.showSuccess('Success', 'User account created successfully');
    }
  }

  void togglePassword(){
    showPassword(!showPassword.value);
  }

  void onEmailInputChanged(String value) {
    email(value);
  }

  void onPasswordInputChanged(String value) {
    password(value);
  }

  String? validateEmail(String? email) {
    String? errorMessage;
    if (email!.isEmpty) {
      errorMessage = 'Please enter email address';
    }
    return errorMessage;
  }

  String? validatePassword(String? password) {
    String? errorMessage;
    if (password!.isEmpty) {
      errorMessage = 'Please enter password';
    }
    return errorMessage;
  }

  RxBool get formIsValid =>
      (validateEmail(email.value) == null &&
          validatePassword(password.value) == null).obs;

}