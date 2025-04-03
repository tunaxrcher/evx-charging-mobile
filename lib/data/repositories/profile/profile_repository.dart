import 'package:charging/features/authentication/models/pass_model.dart';
import 'package:charging/features/authentication/models/auth_model.dart';
import 'package:charging/features/personalization/models/user_model.dart';
import 'package:charging/utils/constants/api_constants.dart';
import 'package:charging/utils/http/http_client.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../features/profile/screens/profile/profile_screen.dart';

class ProfileRepository extends GetxController {
  static ProfileRepository get instance => Get.find();
  late UserModel user;
  final deviceStorage = GetStorage();

  /// Function to Show Relevant Screen
  screenRedirectProfile() async {
    Get.offAll(() => const ProfileScreen());
  }

  /// [] - Update Profile
  Future updateProfileById(
      String id, String name, String lasename, String email, String tel) async {
    try {
      dynamic data = {
        'id': id,
        'firstname': name,
        'lastname': lasename,
        'email': email,
        'phone': tel
      };

      // print(data);

      var response = await EvxHttpHelper.post(evxUpdateProfile, data);

      var profileResponse = AuthModel.fromJson(response['data']);

      return profileResponse;
    } catch (e) {
      // TODO:: Handle
    }
  }

  /// [] - Update Profile
  Future getProfileById(String id) async {
    try {
      dynamic data = {'id': id};

      // print(data);

      var response = await EvxHttpHelper.post(evxGetProfile, data);

      var profileResponse = AuthModel.fromJson(response['data']);

      deviceStorage.write('email', profileResponse.email);
      deviceStorage.write('username',
          '${profileResponse.firstname}' + " " + '${profileResponse.lastname}');
      deviceStorage.write('name', profileResponse.firstname);
      deviceStorage.write('lastname', profileResponse.lastname);
      deviceStorage.write('tel', profileResponse.phone);
      deviceStorage.write('id_user', profileResponse.id);

      return profileResponse;
    } catch (e) {
      // TODO:: Handle
    }
  }


   /// [] - change Password
  Future updatePasswordById(
      String id, String oldPass, String newPass, String confNewPass) async {
    try {
      dynamic data = {
        'id': id,
        'oldPass': oldPass,
        'newPass': newPass,
        'confNewPass': confNewPass,
      };

      var response = await EvxHttpHelper.post(evxUpdatePassword, data);

      var updateResponse = PasswordModel.fromJson(response['data']);

      return updateResponse;
    } catch (e) {
      // TODO:: Handle
    }
  }


}
