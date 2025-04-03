import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/widgets/loaders/circular_loader.dart';
import '../../../data/repositories/profile/profile_repository.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';

import '../../../utils/popups/loaders.dart';
import '../../personalization/controllers/user_controller.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final localStorage = GetStorage();
  final name = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final no = TextEditingController();

  final oldpassword = TextEditingController();
  final newpassword = TextEditingController();
  final confnewpassword = TextEditingController();

  @override
  void onInit() {
    name.text = localStorage.read('name') ?? '';
    lastName.text = localStorage.read('lastname') ?? '';
    email.text = localStorage.read('email') ?? '';
    no.text = localStorage.read('tel') ?? '';
    super.onInit();
  }

  /// Logout Loader Function
  Future<void> logout() async {
    try {
      // Start Loading
      EvxFullScreenLoader.openLoadingDialog(
          'Logout you in...', EvxImages.docerAnimation);

      // Logout
      await AuthenticationRepository.instance.logout();

      // Remove Loader
      EvxFullScreenLoader.stopLoading();

      // Redirect
      await AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      EvxFullScreenLoader.stopLoading();
      EvxLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// -- data profile update
  Future<void> updateProfile() async {
    // Start Loading
    EvxFullScreenLoader.openLoadingDialog(
        'update profile...', EvxImages.docerAnimation);

    // Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      EvxFullScreenLoader.stopLoading();
      return;
    }

    // update profile
    await ProfileRepository.instance.updateProfileById(
        localStorage.read('id_user').toString(),
        name.text.trim(),
        lastName.text.trim(),
        email.text.trim(),
        no.text.trim());

    // Remove Loader
    EvxFullScreenLoader.stopLoading();
    await ProfileRepository.instance
        .getProfileById(localStorage.read('id_user').toString());

    // Redirect
    await ProfileRepository.instance.screenRedirectProfile();
  }

  /// -- data pasword update
  Future<void> updatePassword() async {
    // Start Loading
    EvxFullScreenLoader.openLoadingDialog(
        'update profile...', EvxImages.docerAnimation);

    // Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      EvxFullScreenLoader.stopLoading();
      return;
    }

    // update password
    await ProfileRepository.instance.updatePasswordById(
      localStorage.read('id_user').toString(),
      oldpassword.text.trim(),
      newpassword.text.trim(),
      confnewpassword.text.trim(),
    );

    // Remove Loader
    EvxFullScreenLoader.stopLoading();
    await ProfileRepository.instance
        .getProfileById(localStorage.read('id_user').toString());

    // Redirect
    await ProfileRepository.instance.screenRedirectProfile();
  }
}
