import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:work_compass/core/presentation/widgets/app_loading_box.dart';
import 'package:work_compass/features/workforce_compass/presentation/profile/getx/profile_controller.dart';

import '../../../../../core/presentation/theme/primary_color.dart';
import '../../../../../core/presentation/utils/app_assets.dart';
import '../../../../../core/presentation/utils/app_padding.dart';
import '../../../../../core/presentation/utils/app_spacing.dart';
import '../../../../../core/presentation/widgets/animated_column.dart';
import '../../../../../core/presentation/widgets/app_button.dart';
import '../../../../../core/presentation/widgets/app_text_input_field.dart';
import '../../../../../core/utils/base_64.dart';
import '../../../../authentication/data/models/response/user/user_model.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.loadProfileImage();
    controller.getUser();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: AppButton(
            onPressed: () {
              controller.updateTheUser();
            },
            text: 'Update Profile',
            fontSize: 18,
          ),
        ),
        body: AppLoadingBox(
          loading: controller.isLoading.value,
          child: SingleChildScrollView(
           // physics: const BouncingScrollPhysics(),
            child:  FutureBuilder<void>(
                future: controller.getUser(),
                builder: (BuildContext context, _) {
                  return Padding(
                    padding: AppPaddings.mA,
                    child: Obx(
                          () => _buildPersonalProfilePage(context, controller.user.value),
                    ),
                  );
                }),
          ),
        ));
  }

  Widget _buildPersonalProfilePage(BuildContext context, User user) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppAnimatedColumn(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CircleAvatar(
                      radius: 70,
                      child: controller.userProfileImage.value.isEmpty
                          ? Image.asset(AppImageAssets.blankProfilePicture)
                          : controller.userProfileImage.value.contains('http')
                              ? CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  height: 200,
                                  imageUrl: controller.userProfileImage.value,
                                  placeholder: (BuildContext context,
                                          String url) =>
                                      Image.asset(
                                          AppImageAssets.blankProfilePicture),
                                  errorWidget: (BuildContext context,
                                          String url, dynamic error) =>
                                      const Icon(Icons.error),
                                )
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
          ),
          Obx (() => AppTextInputField(
            labelText: 'First Name',
            initialValue: controller.user.value.firstName,
            onChanged: controller.onFirstNameInputChanged,
          ),),
          const AppSpacing(
            v: 10,
          ),
          Obx (() => AppTextInputField(
              labelText: 'Last Name',
              initialValue: controller.user.value.lastName,
              onChanged: controller.onLastNameInputChanged,
          )),
          const AppSpacing(
            v: 10,
          ),
          Obx (() => AppTextInputField(
              labelText: 'Email',
              initialValue: controller.user.value.email,
              onChanged: controller.onEmailInputChanged),),
          const AppSpacing(
            v: 10,
          ),
          Obx (() => AppTextInputField(
              labelText: 'Phone number',
              initialValue: controller.user.value.phone,
              onChanged: controller.onPhoneInputChanged),),
          const AppSpacing(
            v: 10,
          ),
          Obx (() => AppTextInputField(
              labelText: 'Address',
              initialValue: controller.user.value.address,
              onChanged: controller.onAddressInputChanged)),
          const AppSpacing(
            v: 10,
          ),

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
            controller.addImage();
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
