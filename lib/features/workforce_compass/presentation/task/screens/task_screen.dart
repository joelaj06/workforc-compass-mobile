import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:work_compass/core/presentation/theme/app_theme.dart';
import 'package:work_compass/features/workforce_compass/presentation/task/arguments/task_argument.dart';
import 'package:work_compass/features/workforce_compass/presentation/task/getx/task_controller.dart';

import '../../../../../core/presentation/theme/primary_color.dart';
import '../../../../../core/presentation/utils/app_assets_svg.dart';
import '../../../../../core/presentation/utils/app_padding.dart';
import '../../../../../core/presentation/utils/app_spacing.dart';
import '../../../../../core/presentation/widgets/animated_column.dart';
import '../../../../../core/utils/data_formatter.dart';
import '../../../data/models/response/task/task_model.dart';

class TaskScreen extends GetView<TaskController> {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.pageIndex(0);
    final TaskArgument? args =
        ModalRoute.of(context)?.settings.arguments as TaskArgument?;
    if (args != null) {
      controller.task(args.task);
      controller.isCheckedIn();
    }
    // controller.getCurrentLocation();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check In'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                if (controller.pageIndex.value == 0) {
                  Navigator.of(context).maybePop();
                } else {
                  controller.pageController.previousPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                }
              },
              icon: const Icon(Icons.arrow_back),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.navigatePages(1);
        },
        child: const Icon(Icons.navigation_rounded),
      ),
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageIndexChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          _buildCheckPage(args, context),
          _buildMapPage(context, args!.task),
        ],
      ),
    );
  }

  Widget _buildMapPage(BuildContext context, Task task) {
    return Obx(
      () => GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(task.location?.lat ?? 0, task.location?.long ?? 0),
          zoom: 15,
        ),
        onMapCreated: (GoogleMapController mapController) {
          controller.googleMapController.complete(mapController);
          controller.addMarker(
            'currentLocation',
            controller.currentPosition.value,
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
          );
          controller.addMarker('destination',
              LatLng(task.location?.lat ?? 0, task.location?.long ?? 0), null);

          controller.addCircle(
              'dest',
              LatLng(task.location?.lat ?? 0, task.location?.long ?? 0),
              double.parse(
                  (task.location?.radius.toString() ?? 500).toString()));
        },
        markers: controller.markers.values.toSet(),
        circles: controller.circles.values.toSet(),
        polylines: controller.polylines.values.toSet(),
      ),
    );
  }

  Widget _buildCheckPage(TaskArgument? args, BuildContext context) {
    return Padding(
      padding: AppPaddings.mA,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AppAnimatedColumn(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  args?.task.title ?? 'No Title',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showCupertinoModalBottomSheet<dynamic>(
                      expand: false,
                      context: context,
                      builder: (BuildContext context) => SizedBox(
                          height: 300,
                          child: _buildDescriptionModal(args!.task)),
                    );
                  },
                  child: Text(
                    args?.task.description ?? 'No Description',
                    textAlign: TextAlign.left,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const AppSpacing(
                  v: 30,
                ),
                _buildCheckButton(context),
                const AppSpacing(
                  v: 20,
                ),
               _buildAttendanceInfo(),
                const AppSpacing(
                  v: 10,
                ),
                _buildTaskDetailCard(
                  context,
                  'Start Date',
                  DataFormatter.formatDateToString(
                      args?.task.startDate ?? '--'),
                  IconlyBold.calendar,
                ),
                _buildTaskDetailCard(
                  context,
                  'End Date',
                  DataFormatter.formatDateToString(args?.task.dueDate ?? '--'),
                  IconlyBold.calendar,
                ),
                _buildLocationCard(context, args),
              ]),
          Flexible(
            child: Padding(
              padding: AppPaddings.lA,
              child: GestureDetector(
                onTap: () => controller.navigatePages(1),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: context.colors.primary, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: context.colors.primary.shade200,
                  ),
                  child: const Center(
                    child: Text('View Location On Map',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding _buildAttendanceInfo() {
    return Padding(
      padding:  AppPaddings.lA,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Obx(() =>  _buildCheckCard(
              title: 'Clock In',
              icon: AssetSVGs.clockDown,
              time: controller.attendance.value.checkIn ?? '--',
            ),
          ),
          Obx(() =>  _buildCheckCard(
              title: 'Clock Out',
              icon: AssetSVGs.clockUp,
              time: controller.attendance.value.checkout ?? '--',
            ),
          ),
          Obx(() => _buildCheckCard(
              title: 'Working Hrs',
              icon: AssetSVGs.clockCheck,
              time: controller.attendance.value.workingHrs ?? '--',
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _buildCheckButton(BuildContext context) {
    return GestureDetector(
      onTap: controller.checkInOrOut,
      child: Obx(
        () => AvatarGlow(
          glowRadiusFactor: 0.1,
          startDelay: const Duration(seconds: 5),
          glowColor: controller.hasCheckedIn.value
              ? context.colors.secondary
              : context.colors.primary,
          glowShape: BoxShape.circle,
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              border: Border.all(
                color: controller.hasCheckedIn.value
                    ? context.colors.secondary.shade50
                    : context.colors.primary.shade50,
                width: 15,
              ),
              shape: BoxShape.circle,
              color: controller.hasCheckedIn.value
                  ? context.colors.secondary.shade400
                  : context.colors.primary.shade400,
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  const Icon(
                    Icons.touch_app_outlined,
                    color: Colors.white,
                    size: 100,
                  ),
                  Text(
                    controller.hasCheckedIn.value ? 'CLOCK OUT' : 'CLOCK IN',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _buildLocationCard(BuildContext context, TaskArgument? args) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                const Icon(IconlyBold.location),
                const AppSpacing(
                  h: 10,
                ),
                Text('Location',
                    style: context.body2.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w400))
              ],
            ),
            FutureBuilder<String>(
                future: controller.getPlaceMarkFromCoordinates(
                  args!.task.location?.lat ?? 0,
                  args.task.location?.long ?? 0,
                ),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  return snapshot.hasData
                      ? Text(
                          snapshot.data!,
                          style: context.body2.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        )
                      : const Text(
                          'Loading Location...',
                        );
                })
          ],
        ),
        const AppSpacing(
          v: 8,
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildTaskDetailCard(
      BuildContext context, String title, String value, IconData icon) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icon),
                const AppSpacing(
                  h: 10,
                ),
                Text(title,
                    style: context.body2.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w400))
              ],
            ),
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

  Widget _buildDescriptionModal(Task task) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Center(
            child: Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            task.description ?? '...',
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckCard(
      {required String title, required String time, required String icon}) {
    return Padding(
      padding: AppPaddings.mH,
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            icon,
            height: 40,
            width: 40,
            colorFilter:
                const ColorFilter.mode(PrimaryColor.color, BlendMode.srcIn),
            semanticsLabel: title,
          ),
          Text(
            time,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
