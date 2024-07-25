import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_compass/features/workforce_compass/presentation/attendance/getx/attendance_controller.dart';

import '../../../../../core/presentation/theme/hint_color.dart';
import '../../../../../core/presentation/utils/app_padding.dart';

class AttendanceScreen extends GetView<AttendanceController> {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getAttendance();
    return Scaffold(
      body: Column(
        children: <Widget>[
          _buildAttendanceTable(context),
         
        ],
      ),
    );
  }

  Widget _buildAttendanceTable(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTableHeader(context),
        ...List<Padding>.generate(controller.attendanceList.length,
                (int index) {
              final List<String> date = controller
                  .formatDate(
                controller.attendanceList[index].createdAt ?? '',
              )
                  .split(' ');
              return Padding(
                padding: AppPaddings.mA.add(AppPaddings.mH),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: AppPaddings.lH,
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: HintColor.color,
                                ),),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  date[0],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),
                                ),
                                Text(
                                  date[1].toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                              controller.attendanceList[index].checkIn ?? '--'),
                        ),
                        Expanded(
                          child: Text(
                              controller.attendanceList[index].checkout ?? '--'),
                        ),
                        Expanded(
                          child: Text(
                            controller.calculateWorkingHours(
                              controller.attendanceList[index].checkIn ?? '',
                              controller.attendanceList[index].checkout ?? '',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider()
                  ],
                ),
              );
            })
      ],
    );
  }

  Widget _buildTableHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: HintColor.color.shade200.withOpacity(0.4),
      child:  Padding(
        padding: AppPaddings.mA,
        child:  Row(
          children: <Widget>[
            Padding(
              padding: AppPaddings.lH,
              child: const SizedBox(
                width: 50,
                child: Text(
                  'Date',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Expanded(
              child: Text(
                'Check In',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Expanded(
              child: Text(
                'Check Out',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Expanded(
              child: Text(
                'Working Hrs',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
