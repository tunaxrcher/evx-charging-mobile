import 'package:charging/features/authentication/models/auth_model.dart';
import 'package:charging/utils/constants/api_constants.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../features/authentication/screens/signinsignup/signtab.dart';
import '../../../features/personalization/models/user_model.dart';
import '../../../home_menu.dart';
import '../../../utils/http/http_client.dart';
import '../../../utils/local_storage/storage_utility.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  late UserModel user;

  // late final Rx<User?> _firebaseUser;
  // final _auth = FirebaseAuth.instance;

  /// Getters
  // User? get firebaseUser => _firebaseUser.value;

  // String get getUserID => _firebaseUser.value?.uid ?? "";
  //
  // String get getUserEmail => _firebaseUser.value?.email ?? "";
  //
  // String get getDisplayName => _firebaseUser.value?.displayName ?? "";
  //
  // String get getPhoneNo => _firebaseUser.value?.phoneNumber ?? "";

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  screenRedirect() async {
    var token = deviceStorage.read('token') ??
        null; // Todo:: handle case: if token expire

    if (token != null)
      Get.offAll(() => const HomeMenu());
    else
      Get.offAll(() => const SignTab());
  }

  /* ---------------------------- Phone & Password sign-in ---------------------------------*/

  /// [PhoneAuthentication] - SignIn
  Future loginWithPhoneAndPassword(String phone, String password) async {
    try {
      // dynamic data = {'phone': phone, 'password': password};

      dynamic data = {
        'phone': '0903580757',
        'password': '1234test'
      }; // ยูสนี้มีอยู่ใน DATABASE อยู่แล้ว

      var response = await EvxHttpHelper.post(evxLogin, data);

      var authResponse = AuthModel.fromJson(response['data']);

      deviceStorage.write('token', authResponse.token);
      deviceStorage.write('email', authResponse.email);
      deviceStorage.write('username',
          '${authResponse.firstname}' + " " + '${authResponse.lastname}');
      deviceStorage.write('name', authResponse.firstname);
      deviceStorage.write('lastname', authResponse.lastname);
      deviceStorage.write('tel', authResponse.phone);
      deviceStorage.write('id_user', authResponse.id);

      return authResponse;
    } catch (e) {
      // TODO:: Handle

      screenRedirect();
    }
  }

  /// [PhoneAuthentication] - REGISTER
  // Future<UserCredential> registerWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     return await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //   } catch (e) {
  //     // TODO:: Handle
  //   }
  // }

  /// [] - Update Profile
  Future registeNew(String name, String lasename, String password, String email,
      String tel) async {
    try {
      dynamic data = {
        'phone': tel,
        'password': password,
        'firstname': name,
        'lastname': lasename,
        'email': email,
      };

      // print(data);

      var response = await EvxHttpHelper.post(evxRegistration, data);

      var registerResponse = AuthModel.fromJson(response['data']);

      return registerResponse;
    } catch (e) {
      // TODO:: Handle
    }
  }

  /* ---------------------------- Federated identity & social sign-in ---------------------------------*/

  // TODO:: Handle

  /* ---------------------------- ./end Federated identity & social sign-in ---------------------------------*/

  /// [LogoutUser] - Valid for any authentication.
  Future<void> logout() async {
    try {
      deviceStorage.erase();
    } catch (e) {
      // TODO:: Handle
    }
  }
}
