import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:work_compass/core/presentation/theme/app_theme.dart';
import 'package:work_compass/core/presentation/theme/hint_color.dart';
import 'package:work_compass/core/presentation/utils/app_assets.dart';
import 'package:work_compass/core/presentation/utils/app_padding.dart';
import 'package:work_compass/core/presentation/utils/app_spacing.dart';
import 'package:work_compass/core/presentation/widgets/animated_column.dart';
import 'package:work_compass/core/presentation/widgets/app_text_input_field.dart';
import 'package:work_compass/core/utils/data_formatter.dart';
import 'package:work_compass/features/workforce_compass/data/models/response/task/task_model.dart';
import 'package:work_compass/features/workforce_compass/presentation/home/getx/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getCurrentLocation();
    //controller.getUserTasks();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildMainHeader(context),
            const AppSpacing(
              v: 10,
            ),
            _buildTitle('Pending Jobs'),
            const AppSpacing(
              v: 10,
            ),
            _buildPendingWorksList(),
            _buildTitle('Completed'),
            _buildCompletedTaskList(),
          ],
        ),
      ),
    );
  }

  Padding _buildTitle(String title) {
    return Padding(
      padding: AppPaddings.mH,
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  Widget _buildMainHeader(BuildContext context) {
    return Container(
      height: context.height * 0.30,
      padding: AppPaddings.lA,
      decoration: BoxDecoration(
          color: context.colors.primary.shade400,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: AppAnimatedColumn(
        children: <Widget>[
          _buildProfile(context),
          const AppSpacing(
            v: 20,
          ),
          const Text(
            'All your work & projects at one \n place',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const AppSpacing(
            v: 10,
          ),
          AppTextInputField(
            suffixIcon: GestureDetector(
              onTap: () => controller.getUserTasks(),
              child: const Icon(
                IconlyLight.search,
                color: Colors.white,
              ),
            ),
            onChanged: controller.onSearchQueryFieldInputChanged,
            onFieldSubmitted: controller.onSearchQueryFieldSubmit,
            textInputType: TextInputType.text,
            hintText: 'Search your works',
            textColor: Colors.white,
            hintStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedTaskList() {
    return SizedBox(
      height: 300,
      child: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator.adaptive()),
              )
            : controller.completedTasks.isEmpty
                ? const Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('No completed tasks found'),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.completedTasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildCompletedTaskListCard(
                          context, controller.completedTasks[index]);
                    }),
      ),
    );
  }

  Widget _buildCompletedTaskListCard(BuildContext context, Task task) {
    return Padding(
      padding: AppPaddings.sA,
      child: Container(
        height: 100,
        padding: AppPaddings.sA,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: context.colors.primary, width: 2)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                AppImageAssets.task,
                width: 100,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    task.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                IconlyLight.calendar,
                                color: context.colors.primary.shade900,
                              ),
                              Text(DataFormatter.formatDateToString(
                                  task.startDate ?? '')),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPendingWorksList() {
    return SizedBox(
      height: 300,
      child: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator.adaptive()),
              )
            : controller.pendingTasks.isEmpty
                ? const Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('You have no pending task'),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.pendingTasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Obx(() => _buildPendingWorkCard(
                          context, controller.pendingTasks[index]));
                    }),
      ),
    );
  }

  Widget _buildPendingWorkCard(BuildContext context, Task task) {
    return SizedBox(
      width: 200,
      child: Padding(
        padding: AppPaddings.sA,
        child: Container(
          height: 80,
          padding: AppPaddings.sA,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: context.colors.primary, width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  AppImageAssets.task,
                  width: 180,
                ),
              ),
              Flexible(
                child: Text(
                  task.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Icon(
                    IconlyLight.calendar,
                    color: context.colors.primary.shade900,
                  ),
                  const SizedBox(width: 4), // Add a small space between the icon and text
                  Flexible(
                    child: Text(
                      DataFormatter.formatDateToString(task.startDate ?? ''),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    controller.navigateToTaskScreen(task);
                  },
                  child: SizedBox(
                    width: 180,
                    child: Container(
                      padding: AppPaddings.sA.add(AppPaddings.sH),
                      decoration: BoxDecoration(
                        color: context.colors.primary,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: context.colors.primary,
                          width: 2,
                        ),
                      ),
                      child: const Text(
                        'View',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Row _buildProfile(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: AppPaddings.sR,
          child: Obx(
            () => CircleAvatar(
              radius: 26,
              backgroundColor: HintColor.color.shade300,
              child: controller.user.value.imgUrl != null
                  ? CachedNetworkImage(
                      imageUrl: controller.user.value.imgUrl!,
                      placeholder: (BuildContext context, String url) =>
                          Image.asset(AppImageAssets.blankProfilePicture),
                      errorWidget:
                          (BuildContext context, String url, dynamic error) =>
                              const Icon(Icons.error),
                    )
                  : const Icon(Icons.person),
            ),
          ),
        ),
        Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${controller.user.value.firstName} ${controller.user.value.lastName ?? ''}',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  // Adjusted to start
                  children: <Widget>[
                    const Icon(IconlyBold.location),
                    const SizedBox(width: 5),
                    // Optional spacing between icon and text
                    SizedBox(
                      width: context.width * 0.7,
                      child: Obx(() => Text(
                            controller.isloadingCurrentLocation.value
                                ? 'Updating location'
                                : controller.currentLocation.value,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            )),
      ],
    );
  }
}
