import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:work_compass/core/presentation/utils/app_snack.dart';
import 'package:work_compass/features/authentication/data/datasource/auth_local_data_source.dart';
import 'package:work_compass/features/authentication/data/domain/usecase/logout.dart';
import 'package:work_compass/features/authentication/data/domain/usecase/user/fetch_user.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/presentation/routes/app_routes.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../core/utils/base_64.dart';
import '../../../../authentication/data/domain/usecase/user/update_user.dart';
import '../../../../authentication/data/models/request/user/user_request.dart';
import '../../../../authentication/data/models/response/generic/message_response.dart';
import '../../../../authentication/data/models/response/login/login_response.dart';
import '../../../../authentication/data/models/response/user/user_model.dart';
class ProfileController extends GetxController {
  ProfileController({required this.updateUser,
    required this.logout,
    required this.fetchUser});

  final UpdateUser updateUser;
  final Logout logout;
  final FetchUser fetchUser;


  //reactive variables
  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString email = ''.obs;
  RxString address = ''.obs;
  RxString jobTitle = ''.obs;
  RxString jobDescription = ''.obs;
  RxString company = ''.obs;
  RxString phone = ''.obs;
  Rx<XFile?> selectedImageFile = XFile('').obs;
  Rx<User> user = User.empty().obs;
  RxBool isLoading = false.obs;
  RxString userProfileImage = ''.obs;
  RxString currentProfileImage = ''.obs;


  ImagePicker picker = ImagePicker();

  final AuthLocalDataSource _authLocalDataSource = Get.find();


  void userLogout() async {
    isLoading(true);
    final Either<Failure, MessageResponse> failureOrResponse =
    await logout(NoParams());
    failureOrResponse.fold(
          (Failure failure) {
        isLoading(false);
        AppSnack.show(title: '', message: failure.message, status: SnackStatus.error);
      },
          (MessageResponse response) {
        isLoading(false);
        AppSnack.show(title: '', message: 'User successfully logged out');

        Get.toNamed<dynamic>(AppRoutes.login);
      },
    );
  }

  void updateTheUser() async {
    final UserRequest userRequest = UserRequest(
      id: user.value.id,
      image: userProfileImage.value.isEmpty
          ? currentProfileImage.value
          : userProfileImage.value,
      firstName: firstName.value.isEmpty ? null : firstName.value,
      lastName: lastName.value.isEmpty ? null : lastName.value,
      email: email.value.isEmpty ? null : email.value,
      phone: phone.value.isEmpty ? null : phone.value,
      address: address.value.isEmpty ? null : address.value,
      jobTitle: jobTitle.value.isEmpty ? null : jobTitle.value,

    );

    final Either<Failure, User> failureOrUser = await updateUser(userRequest);
    failureOrUser.fold(
          (Failure failure) {
        AppSnack.show(title: '', message: failure.message, status: SnackStatus.error);
      },
          (User userRes) {
       AppSnack.show(title: '', message: 'User profile updated successfully',status: SnackStatus.success);
      },
    );
  }

  Future<void> getUser() async {
    final LoginResponse? response = _authLocalDataSource.authResponse ??
        await _authLocalDataSource.getAuthResponse();
    final Either<Failure, User> failureOrUser =
    await fetchUser(response?.id ?? '');
    failureOrUser.fold(
          (Failure failure) {
        isLoading(false);
      },
          (User userRes) {
        isLoading(false);
        user(userRes);
        // Check if userRes.skills is not null before adding
      },
    );
  }

  void addImage() async {
    final Map<Permission, PermissionStatus> statuses = await <Permission>[
      Permission.storage,
      Permission.camera,
    ].request();
    if (statuses[Permission.storage]!.isGranted &&
        statuses[Permission.camera]!.isGranted) {
      showImagePicker();
    } else {
      AppSnack.show(title: '', message: 'Permission not granted');
    }
  }

  void showImagePicker() async {
    final XFile? imageFile =
    await picker.pickImage(source: ImageSource.gallery);
    final double size = await Base64Convertor.checkImageSize(imageFile);
    if (size > 5) {
      AppSnack.show(title: '', message: 'Image should not exceed 5MB',
      status: SnackStatus.info,);
      return;
    }
    if (imageFile != null) {
      final String base64StringImage =
      Base64Convertor().imageToBase64(imageFile.path);
        userProfileImage(base64StringImage);
    }
  }


  void loadProfileImage() {
    currentProfileImage(user.value.imgUrl);
    userProfileImage(user.value.imgUrl);
  }

  void removeProfileImage() {
    userProfileImage('');
  }

  void onFirstNameInputChanged(String value) {
    firstName(value);
  }



  void onPhoneInputChanged(String value) {
    phone(value);
  }

  void onLastNameInputChanged(String value) {
    lastName(value);
  }

  void onEmailInputChanged(String value) {
    email(value);
  }

  void onAddressInputChanged(String value) {
    address(value);
  }

  void onJobTitleInputChanged(String value) {
    jobTitle(value);
  }

}