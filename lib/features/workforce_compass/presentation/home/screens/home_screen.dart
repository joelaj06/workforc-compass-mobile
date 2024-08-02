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
    //  controller.getCurrentLocation();
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
          _buildProfile(),
          const AppSpacing(
            v: 20,
          ),
          const Text(
            'All your work & projects at one \n place',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const AppSpacing(
            v: 20,
          ),
          AppTextInputField(
            suffixIcon: const Icon(
              IconlyLight.search,
              color: Colors.white,
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
      child: GestureDetector(
        onTap: controller.navigateToTaskScreen,
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
                            /* SizedBox(
                              child: Container(
                                padding: AppPaddings.sA.add(AppPaddings.sH),
                                decoration: BoxDecoration(
                                   // color: context.colors.primary,
                                    borderRadius: BorderRadius.circular(50),
                                    border:
                                    Border.all(color: context.colors.primary, width: 2)),
                                child: const Text('View',
                                  style: TextStyle(color: Colors.white,),
                                  textAlign: TextAlign.center,),
                              ),
                            ),*/
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
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: controller.tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Obx(() =>
                      _buildPendingWorkCard(context, controller.tasks[index]));
                }),
      ),
    );
  }

  Padding _buildPendingWorkCard(BuildContext context, Task task) {
    return Padding(
      padding: AppPaddings.sA,
      child: Container(
        height: 80,
        padding: AppPaddings.sA,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: context.colors.primary, width: 2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                AppImageAssets.task,
                width: 180,
              ),
            ),
            Text(
              task.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: <Widget>[
                Icon(
                  IconlyLight.calendar,
                  color: context.colors.primary.shade900,
                ),
                Text(DataFormatter.formatDateToString(task.startDate ?? '')),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: controller.navigateToTaskScreen,
                child: SizedBox(
                  width: 180,
                  child: Container(
                    padding: AppPaddings.sA.add(AppPaddings.sH),
                    decoration: BoxDecoration(
                        color: context.colors.primary,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: context.colors.primary, width: 2)),
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
            )
          ],
        ),
      ),
    );
  }

  Row _buildProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: AppPaddings.sR,
          child: CircleAvatar(
            radius: 26,
            backgroundColor: HintColor.color.shade300,
            child: const Icon(Icons.person),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(IconlyBold.location),
                    Obx(
                      () => FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          controller.isloadingCurrentLocation.value
                              ? 'Loading location'
                              : controller.currentLocation.value,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ],
    );
  }
}
