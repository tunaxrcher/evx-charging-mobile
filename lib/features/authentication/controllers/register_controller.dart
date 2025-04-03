import 'package:charging/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';

import '../../../utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  // final hidePassword = true.obs;
  // final rememberMe = false.obs;
  final localStorage = GetStorage();
  final phone = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  final name = TextEditingController();
  final lastname = TextEditingController();

  // GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  /// -- data register
  Future<void> register() async {
    // Start Loading
    EvxFullScreenLoader.openLoadingDialog(
        'create account...', EvxImages.docerAnimation);

    // Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      EvxFullScreenLoader.stopLoading();
      return;
    }

    // register
    await AuthenticationRepository.instance.registeNew(
      name.text.trim(),
      lastname.text.trim(),
      password.text.trim(),
      email.text.trim(),
      phone.text.trim(),
    );

    // Remove Loader
    EvxFullScreenLoader.stopLoading();

    // Redirect
    await AuthenticationRepository.instance.screenRedirect();
  }
}
