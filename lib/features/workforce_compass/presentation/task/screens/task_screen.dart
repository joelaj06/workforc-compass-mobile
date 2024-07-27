import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:work_compass/core/presentation/theme/app_theme.dart';
import 'package:work_compass/features/workforce_compass/presentation/task/getx/task_controller.dart';

import '../../../../../core/presentation/theme/primary_color.dart';
import '../../../../../core/presentation/utils/app_assets_svg.dart';
import '../../../../../core/presentation/utils/app_padding.dart';
import '../../../../../core/presentation/utils/app_spacing.dart';
import '../../../../../core/presentation/widgets/animated_column.dart';
class TaskScreen extends GetView<TaskController> {
  const TaskScreen({super.key});


  @override
  Widget build(BuildContext context) {
    controller.getCurrentLocation();
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => const Text('')),
        /*actions: <Widget>[
          Padding(
            padding: AppPaddings.sR,
            child: CircleAvatar(
              backgroundColor: HintColor.color.shade300,
              child: const Icon(Icons.person),
            ),
          )
        ],*/
      ),
      body: Center(
        child: AppAnimatedColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Obx(() => Text(
              controller.currentTime.value,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w500,
              ),
            )),
            Obx(() => Text(
              controller.currentDate.value,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16
              ),
            )),
            const AppSpacing(
              v: 40,
            ),
            GestureDetector(
              onTap: () {},
              child: AvatarGlow(
                glowRadiusFactor: 0.1,
                startDelay: const Duration(seconds: 5),
                glowColor: context.colors.primary,
                glowShape: BoxShape.circle,
                child: Container(
                  padding: const EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.colors.primary.shade50,
                      width: 15,
                    ),
                    shape: BoxShape.circle,
                    color: context.colors.primary.shade400,
                    //  borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.touch_app_outlined,
                          color: Colors.white,
                          size: 100,
                        ),
                        Text(
                          'CLOCK IN',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const AppSpacing(
              v: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(IconlyBold.location),
                Obx(
                      () => Text(controller.isloadingCurrentLocation.value
                      ? 'Loading location'
                      : controller.currentLocation.value),
                )
              ],
            ),
            Padding(
              padding:
              AppPaddings.lH.add(AppPaddings.lH).add(AppPaddings.bodyA),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildCheckCard(
                      title: 'Clock In', icon: AssetSVGs.clockDown, time: '--'),
                  _buildCheckCard(
                      title: 'Clock Out', icon: AssetSVGs.clockUp, time: '--'),
                  _buildCheckCard(
                      title: 'Working Hrs',
                      icon: AssetSVGs.clockCheck,
                      time: '--'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCheckCard(
      {required String title, required String time, required String icon}) {
    return Column(
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
    );
  }
}
