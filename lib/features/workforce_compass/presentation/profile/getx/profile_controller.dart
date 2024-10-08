import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:work_compass/core/presentation/utils/app_snack.dart';
import 'package:work_compass/features/authentication/data/datasource/auth_local_data_source.dart';
import 'package:work_compass/features/authentication/data/domain/usecase/logout.dart';
import 'package:work_compass/features/authentication/data/domain/usecase/password_reset.dart';
import 'package:work_compass/features/authentication/data/domain/usecase/user/fetch_user.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/presentation/routes/app_routes.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../core/utils/base_64.dart';
import '../../../../authentication/data/domain/usecase/user/update_user.dart';
import '../../../../authentication/data/models/request/password_reset/password_reset_request.dart';
import '../../../../authentication/data/models/request/user/user_request.dart';
import '../../../../authentication/data/models/response/generic/message_response.dart';
import '../../../../authentication/data/models/response/login/login_response.dart';
import '../../../../authentication/data/models/response/user/user_model.dart';

class ProfileController extends GetxController {
  ProfileController(
      {required this.updateUser,
      required this.logout,
      required this.fetchUser,
      required this.resetPassword});

  final UpdateUser updateUser;
  final Logout logout;
  final FetchUser fetchUser;
  final ResetPassword resetPassword;

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
  RxString password = ''.obs;
  RxString currentPassword = ''.obs;
  RxString passwordConfirmation = ''.obs;
  RxBool showPassword = false.obs;

  ImagePicker picker = ImagePicker();

  final AuthLocalDataSource _authLocalDataSource = Get.find();

  void resetUserPassword() async {
    isLoading(true);
    final Either<Failure, MessageResponse> failureOrResponse =
        await resetPassword(
      PasswordResetRequest(
        password: password.value,
        oldPassword: currentPassword.value,
      ),
    );
    failureOrResponse.fold(
      (Failure failure) {
        isLoading(false);
        AppSnack.show(
            title: '', message: failure.message, status: SnackStatus.error);
      },
      (MessageResponse response) {
        isLoading(false);
        AppSnack.show(
            title: '',
            message: 'Password reset successful',
            status: SnackStatus.success);
      },
    );
  }

  void onCurrentPasswordInputChanged(String value) {
    currentPassword(value);
  }

  void onPasswordInputChanged(String value) {
    password(value);
  }

  void onPasswordConfirmationInputChanged(String value) {
    passwordConfirmation(value);
  }

  String? validatePasswordConfirmation(String? value) {
    String? errorMessage;
    if (value!.isEmpty || value != password.value) {
      errorMessage = 'Password do not match';
    }
    return errorMessage;
  }

  String? validatePassword(String? password) {
    String? errorMessage;
    if (password!.isNotEmpty) {
      if (password.length < 8) {
        errorMessage = 'Password must be 8 characters or more';
      }
    } else {
      errorMessage = 'Please enter password';
    }
    return errorMessage;
  }

  void togglePassword() {
    showPassword(!showPassword.value);
  }

  void userLogout() async {
    isLoading(true);
    final Either<Failure, MessageResponse> failureOrResponse =
        await logout(NoParams());
    failureOrResponse.fold(
      (Failure failure) {
        isLoading(false);
        AppSnack.show(
            title: '', message: failure.message, status: SnackStatus.error);
      },
      (MessageResponse response) {
        isLoading(false);
        AppSnack.show(
            title: '',
            message: 'User successfully logged out',
            status: SnackStatus.success);

        Get.toNamed<dynamic>(AppRoutes.login);
      },
    );
  }

  void updateTheUser() async {
    isLoading(true);
    final UserRequest userRequest = UserRequest(
      id: user.value.id,
      image: userProfileImage.value.isEmpty
          ? currentProfileImage.value
          : userProfileImage.value,
      firstName:
          firstName.value.isEmpty ? user.value.firstName : firstName.value,
      lastName: lastName.value.isEmpty ? user.value.lastName : lastName.value,
      email: email.value.isEmpty ? user.value.email : email.value,
      phone: phone.value.isEmpty ? user.value.phone : phone.value,
      address: address.value.isEmpty ? user.value.address : address.value,
      jobTitle: jobTitle.value.isEmpty ? user.value.jobTitle : jobTitle.value,
    );

    final Either<Failure, User> failureOrUser = await updateUser(userRequest);
    failureOrUser.fold(
      (Failure failure) {
        isLoading(false);
        AppSnack.show(
            title: '', message: failure.message, status: SnackStatus.error);
      },
      (User userRes) {
        isLoading(false);
        AppSnack.show(
            title: '',
            message: 'User profile updated successfully',
            status: SnackStatus.success);
      },
    );
  }

  Future<void> getUser() async {
    isLoading(true);
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
      AppSnack.show(
        title: '',
        message: 'Image should not exceed 5MB',
        status: SnackStatus.info,
      );
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


  RxBool get clientFormIsValid => (
      validatePasswordConfirmation(passwordConfirmation.value) == null &&
      validatePassword(password.value) == null)
      .obs;
}
