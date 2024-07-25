import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:work_compass/core/presentation/utils/app_snack.dart';
import 'package:work_compass/core/usecase/usecase.dart';
import 'package:work_compass/features/authentication/data/datasource/auth_local_data_source.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/attendance/attendance_model.dart';
import 'package:work_compass/features/workforce_compass/domain/usecases/attendance/fetch_user_attendance.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../authentication/data/models/response/login/login_response.dart';

class AttendanceController extends GetxController {
  AttendanceController({required this.fetchUserAttendance});

  final FetchUserAttendance fetchUserAttendance;

  //reactive variables
  RxString startDate = '2022-09-05'.obs;
  RxString endDate = '2022-09-10'.obs;
  RxList<Attendance> attendanceList = <Attendance>[].obs;

  final AuthLocalDataSource _authLocalDataSource = Get.find();


  @override
  void onInit() {
    getAttendance();
    super.onInit();
  }


  void getAttendance() async {
    final LoginResponse? user = await getUser();
    final Either<Failure, List<Attendance>> failureOrAttendance =
        await fetchUserAttendance(PageParams(
      page: 0,
      size: 0,
      startDate: startDate.value,
      endDate: endDate.value,
      userId: '63154000dc317dd7cd1d5f95', // user?.id,
    ));
    failureOrAttendance.fold((Failure failure) {
      AppSnack.show(title: 'Attendance', message: failure.message);
    }, (List<Attendance> attendance) {
      attendanceList(attendance);
    });
  }

  Future<LoginResponse?> getUser() async {
    final LoginResponse? response = _authLocalDataSource.authResponse ??
        await _authLocalDataSource.getAuthResponse();
    return response;
  }

  String formatDate(String createdAt) {
    if(createdAt.isEmpty) {
      return 'N/A';
    }
    // Parse the createdAt field to a DateTime object
    final DateTime dateTime = DateTime.parse(createdAt);

    // Format the date as "dd EEE"
    final DateFormat formatter = DateFormat('dd EEE');
    final String formattedDate = formatter.format(dateTime);

    return formattedDate;
  }

  String calculateWorkingHours(String checkIn, String checkOut) {
    if(checkOut.isEmpty) {
      return '--';
    }
    // Parse the check-in and check-out times
    final TimeOfDay checkInTime = TimeOfDay(
      hour: int.parse(checkIn.split(':')[0]),
      minute: int.parse(checkIn.split(':')[1]),
    );
    final TimeOfDay checkOutTime = TimeOfDay(
      hour: int.parse(checkOut.split(':')[0]),
      minute: int.parse(checkOut.split(':')[1]),
    );

    // Calculate the difference in minutes
    final int checkInMinutes = checkInTime.hour * 60 + checkInTime.minute;
    final int checkOutMinutes = checkOutTime.hour * 60 + checkOutTime.minute;
    final int differenceInMinutes = checkOutMinutes - checkInMinutes;

    // Convert the difference to hours and minutes
    final int hours = differenceInMinutes ~/ 60;
    final int minutes = differenceInMinutes % 60;

    // Format the result
    final String formattedResult =
        '${hours.toString().padLeft(2, '0')}hrs ${minutes.toString().padLeft(2, '0')}mins';

    return formattedResult;
  }
}
