
import 'package:get/get.dart';
import 'package:work_compass/features/authentication/presentation/signup/getx/signup_controller.dart';

import '../../../data/domain/usecase/signup.dart';

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpController>(
      SignUpController(
        userSignUp: UserSignUp(
          authRepository: Get.find(),
        ),
      ),
    );
  }
}
