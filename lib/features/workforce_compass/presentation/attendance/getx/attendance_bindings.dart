import 'package:get/get.dart';
import 'package:work_compass/features/workforce_compass/domain/usecases/attendance/fetch_user_attendance.dart';
import 'package:work_compass/features/workforce_compass/presentation/attendance/getx/attendance_controller.dart';

class AttendanceBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AttendanceController>(AttendanceController(
      fetchUserAttendance: FetchUserAttendance(
        workForceRepository: Get.find(),
      ),
    ));
  }
}
