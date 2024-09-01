import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/presentation/theme/primary_color.dart';
import '../../../../../core/presentation/utils/app_assets.dart';
import '../../../../../core/presentation/utils/app_padding.dart';
import '../../../../../core/presentation/utils/app_spacing.dart';
import '../../../../../core/presentation/widgets/animated_column.dart';
import '../../../../../core/presentation/widgets/app_button.dart';
import '../../../../../core/presentation/widgets/app_loading_box.dart';
import '../../../../../core/presentation/widgets/app_text_input_field.dart';
import '../../../../../core/utils/base_64.dart';
import '../getx/signup_controller.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildSignUpFormPage(context);
  }

  Scaffold _buildSignUpFormPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Obx(
          () => AppButton(
            enabled: controller.clientFormIsValid.value,
            onPressed: () {
              controller.signUp();
            },
            text: 'Continue',
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: _buildPersonalProfilePage(context),
      ),
    );
  }

  Widget _buildPersonalProfilePage(
    BuildContext context,
  ) {
    return Obx(
      () => AppLoadingBox(
        loading: controller.isLoading.value,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppAnimatedColumn(
                children: <Widget>[
                  _buildImageUpload(context),
                  AppTextInputField(
                    labelText: 'First Name',
                    onChanged: controller.onFirstNameInputChanged,
                    validator: controller.validateName,
                  ),
                  const AppSpacing(
                    v: 10,
                  ),
                  AppTextInputField(
                    labelText: 'Last Name',
                    onChanged: controller.onLastNameInputChanged,
                    validator: controller.validateName,
                  ),
                  const AppSpacing(
                    v: 10,
                  ),
                  AppTextInputField(
                    labelText: 'Email',
                    onChanged: controller.onEmailInputChanged,
                    validator: controller.validateEmail,
                  ),
                  const AppSpacing(
                    v: 10,
                  ),
                  AppTextInputField(
                    labelText: 'Phone number',
                    onChanged: controller.onPhoneInputChanged,
                    textInputType: TextInputType.phone,
                  ),
                  const AppSpacing(
                    v: 10,
                  ),
                  AppTextInputField(
                      labelText: 'Address',
                      validator: controller.validateName,
                      onChanged: controller.onAddressInputChanged),
                  const AppSpacing(
                    v: 10,
                  ),
                  Obx(
                    () => AppTextInputField(
                      maxLines: 1,
                      labelText: 'Password',
                      onChanged: controller.onPasswordInputChanged,
                      validator: controller.validatePassword,
                      obscureText: !controller.showPassword.value,
                      suffixIcon: AnimatedSwitcher(
                        reverseDuration: Duration.zero,
                        transitionBuilder:
                            (Widget? child, Animation<double> animation) {
                          final Animation<double> offset =
                              Tween<double>(begin: 0, end: 1.0)
                                  .animate(animation);
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
                        transitionBuilder:
                            (Widget? child, Animation<double> animation) {
                          final Animation<double> offset =
                              Tween<double>(begin: 0, end: 1.0)
                                  .animate(animation);
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Align _buildImageUpload(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Container(
            padding: AppPaddings.mA,
            decoration: BoxDecoration(
              color: Colors.white,
              // shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70,
                child: controller.userProfileImage.value.isEmpty
                    ? Image.asset(AppImageAssets.blankProfilePicture)
                    : Image.memory(
                        height: 200,
                        fit: BoxFit.cover,
                        Base64Convertor().base64toImage(
                          controller.userProfileImage.value,
                        ),
                      ),
              ),
            ),
          ),
          Positioned(
              bottom: 1,
              right: 1,
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet<dynamic>(
                    context: context,
                    builder: (BuildContext context) => SizedBox(
                      height: 150,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: AppPaddings.mA,
                          child: _buildImageOptions(context),
                        ),
                      ),
                    ),
                  );
                },
                icon: const CircleAvatar(
                  child: Icon(
                    IconlyBroken.edit,
                    color: Colors.white,
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildImageOptions(BuildContext context) {
    return Column(
      children: <Widget>[
        const Align(
          alignment: Alignment.center,
          child: Text(
            'Choose an option',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        const AppSpacing(
          v: 10,
        ),
        _buildModalListCard(
          onTap: () {
            controller.addSingleImage();
            Navigator.pop(context);
          },
          title: 'Upload Image',
          icon: IconlyBold.paper_upload,
        ),
        _buildModalListCard(
          onTap: () {
            controller.removeProfileImage();
            Navigator.pop(context);
          },
          title: 'Remove',
          icon: IconlyBold.delete,
        ),
      ],
    );
  }

  Widget _buildModalListCard(
      {required VoidCallback onTap,
      required String title,
      required IconData icon}) {
    return InkWell(
      onTap: onTap,
      splashColor: PrimaryColor.color.withOpacity(0.2),
      child: SizedBox(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(icon),
              ],
            ),
            const AppSpacing(
              v: 8,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
