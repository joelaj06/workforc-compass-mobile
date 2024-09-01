import 'package:get/get.dart';
import 'package:work_compass/features/authentication/data/domain/usecase/logout.dart';
import 'package:work_compass/features/authentication/data/domain/usecase/user/fetch_user.dart';
import 'package:work_compass/features/authentication/data/domain/usecase/user/update_user.dart';
import 'package:work_compass/features/workforce_compass/presentation/profile/getx/profile_controller.dart';

class ProfileBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(ProfileController(
      updateUser: UpdateUser(
        Get.find(),
      ),
      logout: Logout(
        authRepository: Get.find(),
      ),
      fetchUser: FetchUser(
        Get.find(),
      )
    ));
  }

}