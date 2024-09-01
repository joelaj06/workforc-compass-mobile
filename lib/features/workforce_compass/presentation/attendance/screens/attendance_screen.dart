import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:work_compass/core/presentation/theme/app_theme.dart';
import 'package:work_compass/core/presentation/widgets/app_custom_listview.dart';
import 'package:work_compass/core/presentation/widgets/app_loading_box.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/attendance/attendance_model.dart';
import 'package:work_compass/features/workforce_compass/presentation/attendance/getx/attendance_controller.dart';

import '../../../../../core/presentation/theme/hint_color.dart';
import '../../../../../core/presentation/utils/app_padding.dart';
import '../../../../../core/presentation/utils/app_spacing.dart';
import '../../../../../core/presentation/widgets/exception_indicators/empty_list_indicator.dart';
import '../../../../../core/presentation/widgets/exception_indicators/error_indicator.dart';
import '../../../../../core/utils/data_formatter.dart';

class AttendanceScreen extends GetView<AttendanceController> {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // controller.getAttendance();
    return Scaffold(
      body: Obx(
        () => AppLoadingBox(
          loading: controller.isLoading.value,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
                  child: _buildMonthPicker(context)),
              Expanded(
                child: Obx(
                  () =>
                      _buildAttendanceTable(context, controller.attendanceList),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAttendanceTable(
      BuildContext context, List<Attendance> attendance) {
    return Column(
      children: <Widget>[
        SizedBox(height: 50,child: _buildTableHeader(context)),
        AppCustomListView<Attendance>(
          items: controller.attendanceList,
          onRefresh: () => controller.getAttendance(),
          errorIndicatorBuilder: ErrorIndicator(
              error: controller.error.value,
              onTryAgain: () => controller.getAttendance()),
          itemBuilder: (BuildContext context, int index) {
            final List<String> date = controller
                .formatDate(
                  attendance[index].createdAt ?? '',
                )
                .split(' ');
            return _buildAttendanceListCard(context, attendance, index, date);
          },
          emptyListIndicatorBuilder: const EmptyListIndicator(),
        ),
      ],
    );
  }

  Padding _buildAttendanceListCard(BuildContext context, List<Attendance> attendance, int index, List<String> date) {
    return Padding(
            padding: AppPaddings.mA.add(AppPaddings.mH),
            child: GestureDetector(
              onTap: () {
                showCupertinoModalBottomSheet<dynamic>(
                  expand: false,
                  context: context,
                  builder: (BuildContext context) => SizedBox(
                    height: 300,
                    child: _buildAttendanceDetailModal(
                        context, attendance[index], index),
                  ),
                );
              },
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
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Text(
                                date[0],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
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
                            controller.attendanceList[index].checkout ??
                                '--'),
                      ),
                      Expanded(
                        child: Text(
                         controller.attendanceList[index].workingHrs ?? '---',
                        ),
                      ),
                    ],
                  ),
                  const Divider()
                ],
              ),
            ),
          );
  }

  Widget _buildMonthPicker(BuildContext context) {
    return InkWell(
      onTap: () => controller.selectMonth(context),
      child: Container(
        color: Colors.white,
        padding: AppPaddings.mA.add(AppPaddings.mA),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              IconlyLight.calendar,
              color: context.colors.primary.shade900,
            ),
            const AppSpacing(
              h: 10,
            ),
            Obx(
              () => Text(
                controller.monthsOfYear[controller.selectedMonth.value - 1]
                    .toString(),
                style: TextStyle(
                  color: context.colors.primary.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const AppSpacing(
              h: 2,
            ),
            Obx(
              () => Text(
                controller.selectedYear.value.toString(),
                style: TextStyle(
                  color: context.colors.primary.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceDetailModal(
      BuildContext context, Attendance attendance, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            _buildModalListCard(context, 'Date',
                DataFormatter.formatDateToString(attendance.createdAt ?? '')),
            _buildModalListCard(
                context, 'Check In', attendance.checkIn ?? '--'),
            _buildModalListCard(
                context, 'Check Out', attendance.checkout ?? '--'),
            _buildModalListCard(
              context,
              'Working Hrs',
              attendance.workingHrs ?? '--',
            ),
            _buildModalListCard(
                context, 'Location', attendance.location ?? '--'),
          ],
        ),
      ),
    );
  }

  Widget _buildModalListCard(BuildContext context, String title, String value) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title,
                style: context.body2.copyWith(
                    color: Colors.black, fontWeight: FontWeight.w400)),
            Text(
              value.toString(),
              style: context.body2
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const AppSpacing(
          v: 8,
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildTableHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: HintColor.color.shade200.withOpacity(0.4),
      child: Padding(
        padding: AppPaddings.mA,
        child: Row(
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
