import 'package:get/get.dart';
import 'package:work_compass/features/authentication/data/domain/usecase/load_user.dart';
import 'package:work_compass/features/authentication/data/domain/usecase/login_user.dart';
import 'package:work_compass/features/authentication/presentation/login/getx/login_controller.dart';

class LoginBindings extends Bindings{
  @override
  void dependencies() {
   Get.put<LoginController>(
     LoginController(loginUser: LoginUser(
       authRepository: Get.find(),
     ),
     loadUser: LoadUser(
       authRepository: Get.find()
     ))
   );
  }

}