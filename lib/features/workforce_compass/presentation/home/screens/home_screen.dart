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
import 'package:work_compass/features/workforce_compass/presentation/home/getx/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  controller.getCurrentLocation();
    return Scaffold(
      body: Column(
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
          _buildTitle('Tasks'),
          Expanded(child: _buildAllTaskList()),
        ],
      ),
    );
  }

  Padding _buildTitle(String title) {
    return Padding(
          padding: AppPaddings.mH,
          child:  Align(
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
            hintText: 'Search your works',
            hintStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllTaskList(){
    return SizedBox(
      height: 300,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return _buildAllTaskListCard(context);
          }),
    );
  }

  Widget _buildAllTaskListCard(BuildContext context){
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
                    const Text(
                      'Fixed pipes at DND',
                      style: TextStyle(
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
                                const Text('25th Dec, 2024'),
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
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return _buildPendingWorkCard(context);
          }),
    );
  }



  Padding _buildPendingWorkCard(BuildContext context) {
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
            const Text(
              'Fixed pipes at DND',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: <Widget>[
                Icon(
                  IconlyLight.calendar,
                  color: context.colors.primary.shade900,
                ),
                const Text('25th Dec, 2024'),
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
                        border:
                            Border.all(color: context.colors.primary, width: 2)),
                    child: const Text('View',
                    style: TextStyle(color: Colors.white,),
                    textAlign: TextAlign.center,),
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
