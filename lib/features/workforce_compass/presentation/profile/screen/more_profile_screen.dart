import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:work_compass/core/presentation/routes/app_routes.dart';
import 'package:work_compass/core/presentation/widgets/animated_column.dart';
import 'package:work_compass/features/workforce_compass/presentation/profile/getx/profile_controller.dart';

import '../../../../../core/presentation/theme/primary_color.dart';
import '../../../../../core/presentation/utils/app_spacing.dart';
import '../../../../../core/presentation/widgets/app_button.dart';
import '../../../../../core/presentation/widgets/app_text_input_field.dart';
import '../../../../../core/presentation/widgets/custom_tile.dart';

class MoreProfileScreen extends GetView<ProfileController> {
  const MoreProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: AppAnimatedColumn(children: <Widget>[
        CustomTile(
          text: 'Profile',
          icon: (IconlyLight.profile),
          onPressed: () {
            Get.toNamed(AppRoutes.profile);
          },
        ),
        CustomTile(
          text: 'Change Password',
          icon: (IconlyLight.lock),
          onPressed: () {
            showMaterialModalBottomSheet<String>(
              context: context,
              bounce: true,
              animationCurve: Curves.fastLinearToSlowEaseIn,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              // expand: false,
              builder: (BuildContext context) => SingleChildScrollView(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  child: Container(
                    height: height * 0.46,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Scaffold(
                      body: Column(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Change Password',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: PrimaryColor.color),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          _buildPasswordForm(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        )
      ]),
    );
  }

  Widget _buildPasswordForm(BuildContext context) {
    return Column(
      children: <Widget>[
        Obx(
          () => AppTextInputField(
            maxLines: 1,
            labelText: 'Password',
            onChanged: controller.onPasswordInputChanged,
            validator: controller.validatePassword,
            obscureText: !controller.showPassword.value,
            suffixIcon: AnimatedSwitcher(
              reverseDuration: Duration.zero,
              transitionBuilder: (Widget? child, Animation<double> animation) {
                final Animation<double> offset =
                    Tween<double>(begin: 0, end: 1.0).animate(animation);
                return ScaleTransition(scale: offset, child: child);
              },
              switchInCurve: Curves.elasticOut,
              duration: const Duration(milliseconds: 700),
              child: IconButton(
                key: ValueKey<bool>(controller.showPassword.value),
                onPressed: controller.togglePassword,
                icon: Obx(
                  () => controller.showPassword.value
                      ? const Icon(
                          Icons.visibility,
                          size: 20,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          size: 20,
                        ),
                ),
              ),
            ),
          ),
        ),
        const AppSpacing(
          v: 10,
        ),
        Obx(
          () => AppTextInputField(
            maxLines: 1,
            labelText: 'Confirm Password',
            onChanged: controller.onPasswordConfirmationInputChanged,
            validator: controller.validatePasswordConfirmation,
            obscureText: !controller.showPassword.value,
            suffixIcon: AnimatedSwitcher(
              reverseDuration: Duration.zero,
              transitionBuilder: (Widget? child, Animation<double> animation) {
                final Animation<double> offset =
                    Tween<double>(begin: 0, end: 1.0).animate(animation);
                return ScaleTransition(scale: offset, child: child);
              },
              switchInCurve: Curves.elasticOut,
              duration: const Duration(milliseconds: 700),
              child: IconButton(
                key: ValueKey<bool>(controller.showPassword.value),
                onPressed: controller.togglePassword,
                icon: Obx(
                  () => controller.showPassword.value
                      ? const Icon(
                          Icons.visibility,
                          size: 20,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          size: 20,
                        ),
                ),
              ),
            ),
          ),
        ),
        const AppSpacing(
          v: 10,
        ),
        Obx(
          () => AppTextInputField(
            maxLines: 1,
            labelText: 'Confirm Password',
            onChanged: controller.onPasswordConfirmationInputChanged,
            validator: controller.validatePasswordConfirmation,
            obscureText: !controller.showPassword.value,
            suffixIcon: AnimatedSwitcher(
              reverseDuration: Duration.zero,
              transitionBuilder: (Widget? child, Animation<double> animation) {
                final Animation<double> offset =
                    Tween<double>(begin: 0, end: 1.0).animate(animation);
                return ScaleTransition(scale: offset, child: child);
              },
              switchInCurve: Curves.elasticOut,
              duration: const Duration(milliseconds: 700),
              child: IconButton(
                key: ValueKey<bool>(controller.showPassword.value),
                onPressed: controller.togglePassword,
                icon: Obx(
                  () => controller.showPassword.value
                      ? const Icon(
                          Icons.visibility,
                          size: 20,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          size: 20,
                        ),
                ),
              ),
            ),
          ),
        ),
        const AppSpacing(
          v: 20,
        ),
        Obx(
          () => AppButton(
            enabled: controller.clientFormIsValid.value,
            onPressed: () {
              controller.resetUserPassword();
            },
            text: 'Continue',
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
