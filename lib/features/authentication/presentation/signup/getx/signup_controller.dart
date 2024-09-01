
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:work_compass/core/presentation/utils/app_snack.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/presentation/widgets/app_snacks.dart';
import '../../../../../core/utils/base_64.dart';
import '../../../data/domain/usecase/signup.dart';
import '../../../data/models/request/user/user_request.dart';
import '../../../data/models/response/user/user_model.dart';

class SignUpController extends GetxController {
  SignUpController({required this.userSignUp,});

  final UserSignUp userSignUp;


  //reactive variables
  RxBool isAgent = false.obs;
  final RxInt pageIndex = 0.obs;
  RxString userProfileImage = ''.obs;
  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString email = ''.obs;
  RxString address = ''.obs;
  RxString jobTitle = ''.obs;
  RxString jobDescription = ''.obs;
  RxString company = ''.obs;
  RxString phone = ''.obs;
  RxString skill = ''.obs;
  RxList<String> skills = <String>[].obs;
  Rx<TextEditingController> skillTextEditingController =
      TextEditingController().obs;
  RxString serviceTitle = ''.obs;
  RxString serviceDescription = ''.obs;
  RxString password = ''.obs;
  RxString passwordConfirmation = ''.obs;
  RxBool showPassword = false.obs;
  RxBool isLoading = false.obs;
  Rx<User> user = User.empty().obs;
  RxList<String> base64Images = <String>[].obs;
  Rx<XFile?> selectedImageFile = XFile('').obs;
  RxList<String> selectedCategories = <String>[].obs;
  RxDouble leastPrice = (0.0).obs;
  RxString serviceCoverImage = ''.obs;
  RxString location = ''.obs;

  ImagePicker picker = ImagePicker();
  final PageController pageController = PageController(initialPage: 0);

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }



  void signUp() async {
    isLoading(true);
    final UserRequest userRequest = UserRequest(
        image: userProfileImage.value,
        lastName: lastName.value,
        firstName: firstName.value,
        email: email.value,
        address: address.value,
        phone: phone.value,
       // jobDescription: jobDescription.value,
        jobTitle: jobTitle.value,
       // company: company.value,
        password: password.value,
        confirmPassword: passwordConfirmation.value);
    final Either<Failure, User> failureOrUser = await userSignUp(userRequest);
    failureOrUser.fold(
      (Failure failure) {
        isLoading(false);
        AppSnack.show(title: '', message: failure.message, status: SnackStatus.error);
      },
      (User userRes) {
        isLoading(false);
        user(userRes);
          Get.back<dynamic>(result: userRes);
      },
    );
  }

  Future<bool> checkPermission() async {
    final Map<Permission, PermissionStatus> statuses = await <Permission>[
      Permission.storage,
      Permission.camera,
    ].request();
    if (statuses[Permission.storage]!.isGranted &&
        statuses[Permission.camera]!.isGranted) {
      return true;
    } else {
      AppSnacks.showInfo('Image Upload', 'Permission not granted');
      return false;
    }
  }



  void addSingleImage() async {
    final bool isGranted = await checkPermission();
    if (isGranted) {
      final String? base64StringImage = await showImagePicker();
      if (base64StringImage != null) {
          userProfileImage(base64StringImage);

      }
    }
  }

  void removeImage(int index) {
    base64Images.removeAt(index);
  }



  Future<String?> showImagePicker() async {
    final XFile? imageFile =
        await picker.pickImage(source: ImageSource.gallery);
    final double size = await Base64Convertor.checkImageSize(imageFile);
    if (size > 5) {
      AppSnacks.showInfo('Large File Size', 'Image should not exceed 5MB',
        duration: const Duration(milliseconds: 3000),
      );
      return null;
    }
    if (imageFile != null) {
      final String base64StringImage =
          Base64Convertor().imageToBase64(imageFile.path);
      return base64StringImage;
    }
    return null;
  }

  void removeProfileImage() {
    userProfileImage('');
  }

  void togglePassword() {
    showPassword(!showPassword.value);
  }

  void onPageChanged(int index) {
    pageIndex(index);
  }

  void navigatePages(int value) {
    pageController.animateToPage(value,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
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

  String? validateName(String? value) {
    String? errorMessage;
    if (value!.isEmpty) {
      errorMessage = 'Field must not be empty';
    }
    return errorMessage;
  }



  String? validateEmail(String? email) {
    String? errorMessage;
    if (email!.isEmpty || !email.contains('@')) {
      errorMessage = 'Please enter a email address';
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



  RxBool get clientFormIsValid => (validateEmail(email.value) == null &&
          validatePasswordConfirmation(passwordConfirmation.value) == null &&
          validateName(address.value) == null &&
          validateName(firstName.value) == null &&
          validateName(phone.value) == null &&
          validateName(lastName.value) == null &&
          validatePassword(password.value) == null)
      .obs;
}
