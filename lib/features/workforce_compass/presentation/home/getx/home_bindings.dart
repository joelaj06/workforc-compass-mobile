import 'package:get/get.dart';
import 'package:work_compass/features/workforce_compass/domain/usecases/organization/fetch_organization.dart';
import 'package:work_compass/features/workforce_compass/domain/usecases/task/fetchUserTasks.dart';
import 'package:work_compass/features/workforce_compass/presentation/home/getx/home_controller.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(
        fetchOrganization: FetchOrganization(
          workForceRepository: Get.find()
        ),
        fetchUserTask: FetchUserTask(
          workForceRepository: Get.find(),
        )
      ),
    );
  }

}