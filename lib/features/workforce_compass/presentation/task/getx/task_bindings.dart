import 'package:get/get.dart';
import 'package:work_compass/features/workforce_compass/presentation/task/getx/task_controller.dart';

class TaskBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<TaskController>(
      TaskController(),
    );
  }

}