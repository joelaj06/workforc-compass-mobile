import 'package:get/get.dart';
import 'package:work_compass/features/workforce_compass/presentation/task/getx/task_controller.dart';

import '../../../domain/usecases/attendance/check_in.dart';
import '../../../domain/usecases/attendance/check_out.dart';

class TaskBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<TaskController>(
      TaskController(
        userCheckIn: UserCheckIn(
          workForceRepository: Get.find(),
        ),
        userCheckOut: UserCheckOut(
          workForceRepository: Get.find(),
        ),
      ),

    );
  }

}